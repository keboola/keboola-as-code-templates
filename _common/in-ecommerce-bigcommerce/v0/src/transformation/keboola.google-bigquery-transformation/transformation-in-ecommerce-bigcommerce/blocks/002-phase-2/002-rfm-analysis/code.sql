/* -------------------------------------------------------------------------------------------------------------------------------------------------------- */ /* - RFM */ /* -------------------------------------------------------------------------------------------------------------------------------------------------------- */
CREATE OR REPLACE TABLE days AS
(
  SELECT
    CAST(CURRENT_DATE - INTERVAL '2' YEAR AS DATE) AS date2years,
    DATE_DIFF(CURRENT_DATE, CURRENT_DATE - INTERVAL '2' YEAR, DAY) AS days
);


/* -------------------------------------------------------------------------------------------------------------------------------------------------------- */ /* - 2 YEAR SNAPSHOT: create a calendar and filling it up with the customer */ /* -------------------------------------------------------------------------------------------------------------------------------------------------------- */ /* - CLEANUP ORDERS TO INCLUDE ONLY SUCCESSFUL, */
DELETE FROM `bdm_orders`
WHERE
  CAST(IS_SUCCESSFUL AS BOOL) = FALSE AND ORDER_CUSTOMER_EMAIL = '';
  
CREATE OR REPLACE TABLE rfm AS
WITH CONSTANTS AS (
  SELECT 
    -24 as M_REVENUE_MONTHS,
    -24 as R_MONTHS,
    (SELECT days FROM days) as DAYS
),
----------------------------------------------------------------------------------------------------------------------------------------------------------
--- 2 YEAR SNAPSHOT: create a calendar and filling it up with the customer
----------------------------------------------------------------------------------------------------------------------------------------------------------
CALENDAR AS (
  SELECT DATE_ADD(d.date2years, INTERVAL seq DAY) AS SNAPSHOT_DATE
  FROM days d,
  UNNEST(GENERATE_ARRAY(0, d.days)) as seq
),

CALENDAR_DAILY AS (
  SELECT CLIENT.*,
         SNAPSHOT_DATE
  FROM CALENDAR
  CROSS JOIN (
    SELECT DISTINCT C.CUSTOMER_ID
    FROM bdm_orders C 
    WHERE ORDER_DATE >= (SELECT date2years FROM days)
  ) CLIENT
  WHERE DATE(SNAPSHOT_DATE) < CURRENT_DATE()
),

----------------------------------------------------------------------------------------------------------------------------------------------------------
--- RFM
----------------------------------------------------------------------------------------------------------------------------------------------------------

RFM_TEMPORARY AS (
  WITH SC AS (
    SELECT 
      SNAP.CUSTOMER_ID,
      SNAP.SNAPSHOT_DATE,
      MIN(DATE(MA.ORDER_DATE)) AS FIRST_SUCCEEDED_TRANSACTION_DATE,
      MAX(DATE(MA.ORDER_DATE)) AS LAST_SUCCEEDED_TRANSACTION_DATE,
      -- Raw R
      DATE_DIFF(SNAPSHOT_DATE, MAX(DATE(MA.ORDER_DATE)), DAY) AS DAYS_SINCE,
      -- Raw F
      COUNT(DISTINCT CASE
        WHEN DATE(MA.ORDER_DATE) >= DATE_SUB(SNAPSHOT_DATE, INTERVAL (SELECT M_REVENUE_MONTHS FROM CONSTANTS) MONTH)
        AND DATE(MA.ORDER_DATE) < SNAPSHOT_DATE
        THEN MA.ORDER_ID
      END) AS TX_COUNT_3M,
      -- Raw M
      SUM(CASE
        WHEN DATE(MA.ORDER_DATE) >= DATE_SUB(SNAPSHOT_DATE, INTERVAL (SELECT M_REVENUE_MONTHS FROM CONSTANTS) MONTH)
        AND DATE(MA.ORDER_DATE) < SNAPSHOT_DATE
        THEN MA.ORDER_TOTAL_PRICE_WITHOUT_TAXES
        ELSE 0
      END) AS REVENUE_SUM_3M,
      -- RFM score with quintile
      NTILE(5) OVER (PARTITION BY SNAPSHOT_DATE ORDER BY DATE_DIFF(SNAPSHOT_DATE, MAX(DATE(MA.ORDER_DATE)), DAY) DESC) AS RECENCY_NTILE_3M,
      NTILE(5) OVER (PARTITION BY SNAPSHOT_DATE ORDER BY COUNT(DISTINCT CASE
        WHEN DATE(MA.ORDER_DATE) >= DATE_SUB(SNAPSHOT_DATE, INTERVAL (SELECT M_REVENUE_MONTHS FROM CONSTANTS) MONTH)
        AND DATE(MA.ORDER_DATE) < SNAPSHOT_DATE
        THEN MA.ORDER_ID
      END)) AS TX_COUNT_NTILE_3M,
      NTILE(5) OVER (PARTITION BY SNAPSHOT_DATE ORDER BY SUM(CASE
        WHEN DATE(MA.ORDER_DATE) >= DATE_SUB(SNAPSHOT_DATE, INTERVAL (SELECT M_REVENUE_MONTHS FROM CONSTANTS) MONTH)
        AND DATE(MA.ORDER_DATE) < SNAPSHOT_DATE
        THEN MA.ORDER_TOTAL_PRICE_WITHOUT_TAXES
        ELSE 0
      END)) AS REVENUE_SUM_NTILE_3M
    FROM bdm_orders MA
    INNER JOIN CALENDAR_DAILY SNAP
      ON MA.CUSTOMER_ID = SNAP.CUSTOMER_ID 
      AND DATE(MA.ORDER_DATE) < SNAP.SNAPSHOT_DATE
    GROUP BY SNAP.CUSTOMER_ID, SNAP.SNAPSHOT_DATE
    HAVING LAST_SUCCEEDED_TRANSACTION_DATE >= DATE_SUB(SNAP.SNAPSHOT_DATE, INTERVAL (SELECT R_MONTHS FROM CONSTANTS) MONTH)
  )
  SELECT 
    S.CUSTOMER_ID,
    S.SNAPSHOT_DATE,
    S.FIRST_SUCCEEDED_TRANSACTION_DATE,
    S.LAST_SUCCEEDED_TRANSACTION_DATE,
    S.DAYS_SINCE,
    S.TX_COUNT_3M,
    S.REVENUE_SUM_3M,
    S.RECENCY_NTILE_3M,
    S.TX_COUNT_NTILE_3M,
    S.REVENUE_SUM_NTILE_3M,
    CONCAT(CAST(S.RECENCY_NTILE_3M AS STRING), 
           CAST(S.TX_COUNT_NTILE_3M AS STRING),
           CAST(S.REVENUE_SUM_NTILE_3M AS STRING)) AS FINAL_SCORE,
    MAP.SEGMENT,
    MAP.SEGMENT_NR,
    LEAD(MAP.SEGMENT) OVER (PARTITION BY S.CUSTOMER_ID ORDER BY S.SNAPSHOT_DATE DESC) AS PRE_SEG_1,
    LEAD(MAP.SEGMENT_NR) OVER (PARTITION BY S.CUSTOMER_ID ORDER BY S.SNAPSHOT_DATE DESC) AS PRE_SEG_NUMBER_1
  FROM SC S
  LEFT JOIN MAPPING_SEGMENT_RFM MAP
    ON CONCAT(CAST(S.RECENCY_NTILE_3M AS STRING), 
             CAST(S.TX_COUNT_NTILE_3M AS STRING),
             CAST(S.REVENUE_SUM_NTILE_3M AS STRING)) = MAP.SCORE
)
SELECT 
    CUSTOMER_ID,
    SNAPSHOT_DATE,
    DAYS_SINCE AS R_RAW,
    RECENCY_NTILE_3M AS R_SCORE,
    TX_COUNT_3M AS F_RAW,
    TX_COUNT_NTILE_3M AS F_SCORE,
    ROUND(REVENUE_SUM_3M, 0) AS M_RAW,
    REVENUE_SUM_NTILE_3M AS M_SCORE,
    FINAL_SCORE,
    SEGMENT,
    SEGMENT_NR,
    PRE_SEG_1,
    PRE_SEG_NUMBER_1,
    DATE_DIFF(SNAPSHOT_DATE, CURRENT_DATE(), DAY) AS TIME_AS,
    FIRST_SUCCEEDED_TRANSACTION_DATE,
    LAST_SUCCEEDED_TRANSACTION_DATE
FROM RFM_TEMPORARY;


-- Adding info about actual status
ALTER TABLE rfm ADD COLUMN actual_state BOOLEAN;

UPDATE rfm
SET actual_state = FALSE
WHERE TRUE;

UPDATE rfm t1
SET actual_state = TRUE
FROM (
    SELECT active.customer_id, active.max_date, MIN(segment_nr) as segment
    FROM rfm rfm 
    INNER JOIN (
        SELECT customer_id, MAX(snapshot_date) as max_date
        FROM rfm
        WHERE snapshot_date <= CURRENT_DATE()
        GROUP BY customer_id
    ) AS active
    ON active.customer_id = rfm.customer_id 
    AND active.max_date = rfm.snapshot_date
    GROUP BY active.customer_id, active.max_date
) act
WHERE act.customer_id = t1.customer_id 
AND act.max_date = t1.snapshot_date
AND act.segment = t1.segment_nr;

DELETE FROM rfm WHERE actual_state != TRUE;

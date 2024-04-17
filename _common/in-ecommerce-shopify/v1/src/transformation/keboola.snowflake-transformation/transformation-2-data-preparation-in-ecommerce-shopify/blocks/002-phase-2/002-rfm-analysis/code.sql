----------------------------------------------------------------------------------------------------------------------------------------------------------
--- RFM
----------------------------------------------------------------------------------------------------------------------------------------------------------
create or replace table days as (
SELECT 
    current_date - interval '2 years' as date2years,
    DATEDIFF(DAY, current_date - interval '2 years', CURRENT_DATE) as days
);

SET M_REVENUE_MONTHS = -24;

SET R_MONTHS = -24;

SET DAYS = (SELECT days FROM days);

----------------------------------------------------------------------------------------------------------------------------------------------------------
--- 2 YEAR SNAPSHOT: create a calendar and filling it up with the customer
----------------------------------------------------------------------------------------------------------------------------------------------------------

--- CLEANUP ORDERS TO INCLUDE ONLY SUCCESSFUL, 
DELETE
FROM "bdm_orders"
WHERE IS_SUCCESSFUL::BOOLEAN = FALSE
  AND ORDER_CUSTOMER_EMAIL = '';

CREATE OR REPLACE TABLE CALENDAR AS
SELECT DATEADD(DAY, SEQ4(), (SELECT date2years FROM days)) AS SNAPSHOT_DATE
FROM TABLE(GENERATOR(ROWCOUNT => $DAYS));

CREATE OR REPLACE TEMPORARY TABLE CALENDAR_DAILY AS
    (SELECT CLIENT.*
          , SNAPSHOT_DATE
     FROM CALENDAR
              LEFT JOIN (SELECT DISTINCT C.CUSTOMER_ID AS CUSTOMER_ID
                         FROM "bdm_orders" C WHERE ORDER_DATE >=(SELECT date2years FROM days)) CLIENT
    WHERE SNAPSHOT_DATE::DATE < CURRENT_DATE);

--SELECT * FROM CALENDAR_DAILY
----------------------------------------------------------------------------------------------------------------------------------------------------------
--- RFM
----------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE TABLE RFM_TEMPORARY
AS
WITH SC AS
         (SELECT SNAP.CUSTOMER_ID
               , SNAP.SNAPSHOT_DATE
               , MIN(MA.ORDER_DATE::DATE)                                          AS FIRST_SUCCEEDED_TRANSACTION_DATE
               , MAX(MA.ORDER_DATE::DATE)                                          AS LAST_SUCCEEDED_TRANSACTION_DATE
               --- Raw R
               , DATEDIFF(DAY, LAST_SUCCEEDED_TRANSACTION_DATE, SNAPSHOT_DATE)       AS DAYS_SINCE
               --- Raw F
               , COUNT(DISTINCT CASE
                           WHEN MA.ORDER_DATE::DATE >= ADD_MONTHS(SNAPSHOT_DATE, $M_REVENUE_MONTHS) AND
                                (MA.ORDER_DATE::DATE < SNAPSHOT_DATE)
                               THEN MA.ORDER_ID
                 END)                                                                AS TX_COUNT_3M
               --- Raw M
               , SUM(CASE
                         WHEN MA.ORDER_DATE::DATE >= ADD_MONTHS(SNAPSHOT_DATE, $M_REVENUE_MONTHS) AND
                              (MA.ORDER_DATE::DATE < SNAPSHOT_DATE)
                             THEN MA.ORDER_TOTAL_PRICE_WITHOUT_TAXES --- price without tax
                         ELSE 0
                 END)                                                                AS REVENUE_SUM_3M

               --- RFM score with quintile
               , NTILE(5) OVER (PARTITION BY SNAPSHOT_DATE ORDER BY DAYS_SINCE DESC) AS RECENCY_NTILE_3M
               , NTILE(5) OVER (PARTITION BY SNAPSHOT_DATE ORDER BY TX_COUNT_3M)     AS TX_COUNT_NTILE_3M
               , NTILE(5) OVER (PARTITION BY SNAPSHOT_DATE ORDER BY REVENUE_SUM_3M)  AS REVENUE_SUM_NTILE_3M

               --- Final Score
               , TO_VARCHAR(RECENCY_NTILE_3M) || TO_VARCHAR(TX_COUNT_NTILE_3M) ||
                 TO_VARCHAR(REVENUE_SUM_NTILE_3M)                                    AS FINAL_SCORE

          FROM "bdm_orders" MA
                   INNER JOIN CALENDAR_DAILY SNAP
                              ON MA.CUSTOMER_ID = SNAP.CUSTOMER_ID AND MA.ORDER_DATE::DATE < SNAP.SNAPSHOT_DATE
          GROUP BY SNAP.CUSTOMER_ID, SNAP.SNAPSHOT_DATE
          HAVING LAST_SUCCEEDED_TRANSACTION_DATE >= DATEADD(MONTH, $R_MONTHS, SNAP.SNAPSHOT_DATE)
         )
SELECT S.CUSTOMER_ID
     , S.SNAPSHOT_DATE
     , S.FIRST_SUCCEEDED_TRANSACTION_DATE
     , S.LAST_SUCCEEDED_TRANSACTION_DATE
     , S.DAYS_SINCE           --- raw r
     , S.TX_COUNT_3M          --- raw f
     , S.REVENUE_SUM_3M       --- raw m
     , S.RECENCY_NTILE_3M     --- r quantile
     , S.TX_COUNT_NTILE_3M    --- quantile f
     , S.REVENUE_SUM_NTILE_3M --- quantile m
     , S.FINAL_SCORE
     , MAP.SEGMENT
     , MAP.SEGMENT_NR
     , LEAD(SEGMENT) OVER (PARTITION BY S.CUSTOMER_ID ORDER BY S.SNAPSHOT_DATE DESC)    AS PRE_SEG_1
     , LEAD(SEGMENT_NR) OVER (PARTITION BY S.CUSTOMER_ID ORDER BY S.SNAPSHOT_DATE DESC) AS PRE_SEG_NUMBER_1
FROM SC S
         LEFT JOIN MAPPING_SEGMENT_RFM MAP
                   ON S.FINAL_SCORE = MAP.SCORE;

--SELECT * FROM RFM_TEMPORARY

CREATE OR REPLACE TABLE "rfm"
AS

SELECT 
    CUSTOMER_ID
     , SNAPSHOT_DATE
     , DAYS_SINCE                           AS R_RAW
     , RECENCY_NTILE_3M                     AS R_SCORE
     , TX_COUNT_3M                          AS F_RAW
     , TX_COUNT_NTILE_3M                    AS F_SCORE
     , ROUND(REVENUE_SUM_3M,0)              AS M_RAW
     , REVENUE_SUM_NTILE_3M                 AS M_SCORE
     , FINAL_SCORE
     , SEGMENT
     , SEGMENT_NR
     , PRE_SEG_1
     , PRE_SEG_NUMBER_1
     , CURRENT_DATE - SNAPSHOT_DATE::DATE AS TIME_AS
     , FIRST_SUCCEEDED_TRANSACTION_DATE
     , LAST_SUCCEEDED_TRANSACTION_DATE
FROM RFM_TEMPORARY RFM;

--- Adding info about actual status
ALTER TABLE "rfm" ADD COLUMN actual_state boolean;

UPDATE "rfm"
SET actual_state = false;

UPDATE "rfm"
SET actual_state = CASE WHEN act.customer_id is not null THEN true ELSE false END
FROM
    (SELECT active.customer_id, active.max_date, min(segment_nr) as segment
     FROM "rfm" rfm 
        INNER JOIN (
        select customer_id, max(snapshot_date) as max_date
        from "rfm"
        where snapshot_date <= current_date()
        group by customer_id) AS active
        ON active.customer_id = rfm.customer_id AND active.max_date = rfm.snapshot_date
     GROUP BY active.customer_id, active.max_date) act   
WHERE act.customer_id = "rfm".customer_id AND act.max_date = "rfm".snapshot_date
    AND act.segment = "rfm".segment_nr;

DELETE FROM "rfm" WHERE actual_state != true;

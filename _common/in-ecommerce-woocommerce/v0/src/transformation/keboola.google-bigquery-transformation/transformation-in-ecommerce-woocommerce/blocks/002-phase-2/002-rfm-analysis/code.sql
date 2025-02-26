/* ------------------------------------------------------------------------------------------------------------------------------------------------------- */ /* - RFM */ /* -------------------------------------------------------------------------------------------------------------------------------------------------------- */
CREATE OR REPLACE TABLE days AS
(
  SELECT
    CURRENT_DATE - INTERVAL '2' YEAR AS date2years,
    DATE_DIFF(CURRENT_DATE, CURRENT_DATE - INTERVAL '2' YEAR, DAY) AS days
);

SET M_REVENUE_MONTHS = -24;

SET R_MONTHS = -24;

SET DAYS = (
  SELECT
    days
  FROM days
);

/* -------------------------------------------------------------------------------------------------------------------------------------------------------- */ /* - 2 YEAR SNAPSHOT: create a calendar and filling it up with the customer */ /* -------------------------------------------------------------------------------------------------------------------------------------------------------- */ /* - CLEANUP ORDERS TO INCLUDE ONLY SUCCESSFUL */
DELETE FROM `bdm_orders`
WHERE
  CAST(IS_SUCCESSFUL AS BOOL) = FALSE AND ORDER_CUSTOMER_EMAIL = '';

CREATE OR REPLACE TABLE CALENDAR AS
SELECT
  DATE_ADD((
    SELECT
      date2years
    FROM days
  ), INTERVAL (SEQ4()) DAY) AS SNAPSHOT_DATE
FROM TABLE(GENERATOR(ROWCOUNT => @DAYS));

CREATE OR REPLACE TEMPORARY TABLE CALENDAR_DAILY AS
(
  SELECT
    CLIENT.*,
    SNAPSHOT_DATE
  FROM CALENDAR
  LEFT JOIN (
    SELECT DISTINCT
      C.CUSTOMER_ID AS CUSTOMER_ID
    FROM `bdm_orders` AS C
    WHERE
      ORDER_DATE >= (
        SELECT
          date2years
        FROM days
      )
  ) AS CLIENT
  WHERE
    CAST(SNAPSHOT_DATE AS DATE) < CURRENT_DATE
);

/* -------------------------------------------------------------------------------------------------------------------------------------------------------- */ /* - RFM */ /* -------------------------------------------------------------------------------------------------------------------------------------------------------- */
CREATE OR REPLACE TABLE RFM_TEMPORARY AS
WITH SC AS (
  SELECT
    SNAP.CUSTOMER_ID,
    SNAP.SNAPSHOT_DATE,
    MIN(CAST(MA.ORDER_DATE AS DATE)) AS FIRST_SUCCEEDED_TRANSACTION_DATE,
    MAX(CAST(MA.ORDER_DATE AS DATE)) AS LAST_SUCCEEDED_TRANSACTION_DATE, /* - Raw R */
    DATE_DIFF(SNAPSHOT_DATE, LAST_SUCCEEDED_TRANSACTION_DATE, DAY) AS DAYS_SINCE, /* - Raw F */
    COUNT(
      DISTINCT CASE
        WHEN CAST(MA.ORDER_DATE AS DATE) >= ADD_MONTHS(SNAPSHOT_DATE, @M_REVENUE_MONTHS)
        AND (
          CAST(MA.ORDER_DATE AS DATE) < SNAPSHOT_DATE
        )
        THEN MA.ORDER_ID
      END
    ) AS TX_COUNT_3M, /* - Raw M */
    SUM(
      CASE
        WHEN CAST(MA.ORDER_DATE AS DATE) >= ADD_MONTHS(SNAPSHOT_DATE, @M_REVENUE_MONTHS)
        AND (
          CAST(MA.ORDER_DATE AS DATE) < SNAPSHOT_DATE
        )
        THEN MA.ORDER_TOTAL_PRICE_WITHOUT_TAXES /* - price without tax */
        ELSE 0
      END
    ) AS REVENUE_SUM_3M, /* - RFM score with quintile */
    NTILE(5) OVER (PARTITION BY SNAPSHOT_DATE ORDER BY DAYS_SINCE DESC NULLS FIRST) AS RECENCY_NTILE_3M,
    NTILE(5) OVER (PARTITION BY SNAPSHOT_DATE ORDER BY TX_COUNT_3M NULLS LAST) AS TX_COUNT_NTILE_3M,
    NTILE(5) OVER (PARTITION BY SNAPSHOT_DATE ORDER BY REVENUE_SUM_3M NULLS LAST) AS REVENUE_SUM_NTILE_3M, /* - Final Score */
    CAST(RECENCY_NTILE_3M AS STRING) || CAST(TX_COUNT_NTILE_3M AS STRING) || CAST(REVENUE_SUM_NTILE_3M AS STRING) AS FINAL_SCORE
  FROM `bdm_orders` AS MA
  INNER JOIN CALENDAR_DAILY AS SNAP
    ON MA.CUSTOMER_ID = SNAP.CUSTOMER_ID
    AND CAST(MA.ORDER_DATE AS DATE) < SNAP.SNAPSHOT_DATE
  GROUP BY
    SNAP.CUSTOMER_ID,
    SNAP.SNAPSHOT_DATE
  HAVING
    LAST_SUCCEEDED_TRANSACTION_DATE >= DATE_ADD(SNAP.SNAPSHOT_DATE, INTERVAL (@R_MONTHS) MONTH)
)
SELECT
  S.CUSTOMER_ID,
  S.SNAPSHOT_DATE,
  S.FIRST_SUCCEEDED_TRANSACTION_DATE,
  S.LAST_SUCCEEDED_TRANSACTION_DATE,
  S.DAYS_SINCE, /* - raw r */
  S.TX_COUNT_3M, /* - raw f */
  S.REVENUE_SUM_3M, /* - raw m */
  S.RECENCY_NTILE_3M, /* - r quantile */
  S.TX_COUNT_NTILE_3M, /* - quantile f */
  S.REVENUE_SUM_NTILE_3M, /* - quantile m */
  S.FINAL_SCORE,
  MAP.SEGMENT,
  MAP.SEGMENT_NR,
  LEAD(SEGMENT) OVER (PARTITION BY S.CUSTOMER_ID ORDER BY S.SNAPSHOT_DATE DESC) AS PRE_SEG_1,
  LEAD(SEGMENT_NR) OVER (PARTITION BY S.CUSTOMER_ID ORDER BY S.SNAPSHOT_DATE DESC) AS PRE_SEG_NUMBER_1
FROM SC AS S
LEFT JOIN MAPPING_SEGMENT_RFM AS MAP
  ON S.FINAL_SCORE = MAP.SCORE;

CREATE OR REPLACE TABLE `rfm` AS
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
  CURRENT_DATE - CAST(SNAPSHOT_DATE AS DATE) AS TIME_AS,
  FIRST_SUCCEEDED_TRANSACTION_DATE,
  LAST_SUCCEEDED_TRANSACTION_DATE
FROM RFM_TEMPORARY AS RFM;

ALTER TABLE `rfm` ADD COLUMN actual_state BOOL /* - Adding info about actual status */;

UPDATE `rfm` SET actual_state = FALSE;

UPDATE `rfm` SET actual_state = CASE WHEN NOT act.customer_id IS NULL THEN TRUE ELSE FALSE END
FROM (
  SELECT
    active.customer_id,
    active.max_date,
    MIN(segment_nr) AS segment
  FROM `rfm` AS rfm
  INNER JOIN (
    SELECT
      customer_id,
      MAX(snapshot_date) AS max_date
    FROM `rfm`
    WHERE
      snapshot_date <= CURRENT_DATE
    GROUP BY
      customer_id
  ) AS active
    ON active.customer_id = rfm.customer_id AND active.max_date = rfm.snapshot_date
  GROUP BY
    active.customer_id,
    active.max_date
) AS act
WHERE
  act.customer_id = `rfm`.customer_id
  AND act.max_date = `rfm`.snapshot_date
  AND act.segment = `rfm`.segment_nr;

DELETE FROM `rfm`
WHERE
  actual_state <> TRUE;
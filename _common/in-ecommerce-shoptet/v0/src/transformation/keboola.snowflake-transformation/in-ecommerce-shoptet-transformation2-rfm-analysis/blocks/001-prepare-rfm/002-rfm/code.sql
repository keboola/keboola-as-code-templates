SET M_REVENUE_MONTHS = -3;

SET R_MONTHS = -6;

----------------------------------------------------------------------------------------------------------------------------------------------------------
--- 2 YEAR SNAPSHOT: create a calendar and filling it up with the customer
----------------------------------------------------------------------------------------------------------------------------------------------------------

--- CLEANUP ORDERS TO INCLUDE ONLY SUCESSFUL
DELETE
FROM "bdm_orders"
WHERE IS_SUCESSFUL::BOOLEAN = FALSE
  AND ORDER_CUSTOMER_EMAIL = '';

CREATE OR REPLACE TABLE CALENDAR AS
    (SELECT DATEADD(DAY, SEQ4(), DATEADD('year', -1, CURRENT_DATE)) AS SNAPSHOT_DATE
     FROM TABLE (GENERATOR(ROWCOUNT => 2 * 365)));

CREATE OR REPLACE TEMPORARY TABLE CALENDAR_DAILY AS
    (SELECT CLIENT.*
          , SNAPSHOT_DATE
     FROM CALENDAR
              LEFT JOIN (SELECT DISTINCT C.ORDER_CUSTOMER_EMAIL AS CUSTOMER_ID
                         FROM "bdm_orders" C) CLIENT);

----------------------------------------------------------------------------------------------------------------------------------------------------------
--- RFM
----------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE TABLE RFM_TEMPORARY
AS
WITH SC AS
         (SELECT SNAP.CUSTOMER_ID
               , SNAP.SNAPSHOT_DATE
               , MIN(MA.ORDER_DATE::DATE)                                            AS FIRST_SUCCEEDED_TRANSACTION_DATE
               , MAX(MA.ORDER_DATE::DATE)                                            AS LAST_SUCCEEDED_TRANSACTION_DATE
               --- Raw R
               , DATEDIFF(DAY, LAST_SUCCEEDED_TRANSACTION_DATE, SNAPSHOT_DATE)       AS DAYS_SINCE
               --- Raw F
               , COUNT(CASE
                           WHEN MA.ORDER_DATE::DATE >= ADD_MONTHS(SNAPSHOT_DATE, $M_REVENUE_MONTHS) AND
                                (MA.ORDER_DATE::DATE < SNAPSHOT_DATE)
                               THEN MA.ORDER_ID
                 END)                                                                AS TX_COUNT_3M
               --- Raw M
               , SUM(CASE
                         WHEN MA.ORDER_DATE::DATE >= ADD_MONTHS(SNAPSHOT_DATE, $M_REVENUE_MONTHS) AND
                              (MA.ORDER_DATE::DATE < SNAPSHOT_DATE)
                             THEN MA.ORDER_TOTAL_PRICE_WITHOUT_WAT
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
                              ON MA.ORDER_CUSTOMER_EMAIL = SNAP.CUSTOMER_ID AND MA.ORDER_DATE::DATE < SNAP.SNAPSHOT_DATE
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

CREATE OR REPLACE TABLE RFM_FINAL
AS
WITH RFM AS
         (SELECT *
          FROM RFM_TEMPORARY
          WHERE SEGMENT != PRE_SEG_1
          ORDER BY CUSTOMER_ID, SNAPSHOT_DATE DESC)
SELECT CUSTOMER_ID
     , SNAPSHOT_DATE
     , DAYS_SINCE                           AS R_RAW
     , RECENCY_NTILE_3M                     AS R_SCORE
     , TX_COUNT_3M                          AS F_RAW
     , TX_COUNT_NTILE_3M                    AS F_SCORE
     , REVENUE_SUM_3M                       AS M_RAW
     , REVENUE_SUM_NTILE_3M                 AS M_SCORE
     , FINAL_SCORE
     , SEGMENT
     , SEGMENT_NR
     , PRE_SEG_1
     , PRE_SEG_NUMBER_1
     , IFNULL(LEAD(RFM.SNAPSHOT_DATE) OVER (PARTITION BY RFM.CUSTOMER_ID ORDER BY RFM.SNAPSHOT_DATE) - SNAPSHOT_DATE,
              CURRENT_DATE - SNAPSHOT_DATE) AS TIME_AS
     , FIRST_SUCCEEDED_TRANSACTION_DATE
FROM RFM;

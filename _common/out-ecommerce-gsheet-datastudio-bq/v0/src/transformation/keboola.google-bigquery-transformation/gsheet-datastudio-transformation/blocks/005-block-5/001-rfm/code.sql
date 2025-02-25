ALTER TABLE `bdmRfm` DROP COLUMN `_timestamp`
CREATE TABLE `bdmRfmEnrich` AS
(
  SELECT
    r.PRE_SEG_NUMBER_1,
    r.M_SCORE,
    r.PRE_SEG_1,
    r.M_RAW,
    r.R_SCORE,
    r.SEGMENT,
    r.TIME_AS,
    r.FIRST_SUCCEEDED_TRANSACTION_DATE,
    r.SEGMENT_NR,
    r.R_RAW,
    r.FINAL_SCORE,
    r.F_RAW,
    r.CUSTOMER_ID,
    r.F_SCORE,
    r.SNAPSHOT_DATE
  FROM `bdmRfm` AS r
  JOIN (
    SELECT
      `CUSTOMER_ID`,
      MAX(`SNAPSHOT_DATE`) AS `SNAPSHOT_DATE`
    FROM `bdmRfm`
    GROUP BY
      `CUSTOMER_ID`
  ) AS l
    ON r.`CUSTOMER_ID` = l.`CUSTOMER_ID` AND r.`SNAPSHOT_DATE` = l.`SNAPSHOT_DATE`
)
UNION ALL
/* inserting dummy values if your table is empty to be able to visualise it in Datastudio */
SELECT
  '3' AS PRE_SEG_NUMBER_1,
  '1' AS M_SCORE,
  'At Risk' AS PRE_SEG_1,
  '0' AS M_RAW,
  '1' AS R_SCORE,
  'Hibernating customers' AS SEGMENT,
  '-69' AS TIME_AS,
  '2022-02-07' AS FIRST_SUCCEEDED_TRANSACTION_DATE,
  '1' AS SEGMENT_NR,
  '173' AS R_RAW,
  '151' AS FINAL_SCORE,
  '0' AS F_RAW,
  'test1@email.com' AS CUSTOMER_ID,
  '5' AS F_SCORE,
  '2022-05-29' AS SNAPSHOT_DATE
WHERE
  (
    SELECT
      COUNT(*)
    FROM `bdmRfm`
  ) = 0
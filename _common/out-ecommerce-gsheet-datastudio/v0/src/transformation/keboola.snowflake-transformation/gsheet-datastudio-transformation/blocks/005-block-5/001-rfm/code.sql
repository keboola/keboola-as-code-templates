ALTER TABLE "bdmRfm" DROP COLUMN "_timestamp";

CREATE TABLE "bdmRfmEnrich" as (
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
FROM "bdmRfm" r
JOIN (SELECT "CUSTOMER_ID", max("SNAPSHOT_DATE") "SNAPSHOT_DATE" from "bdmRfm" group by "CUSTOMER_ID") l
ON r."CUSTOMER_ID" = l."CUSTOMER_ID" and r."SNAPSHOT_DATE" = l."SNAPSHOT_DATE")
UNION ALL
-- inserting dummy values if your table is empty to be able to visualise it in Datastudio
  SELECT 
    '3' PRE_SEG_NUMBER_1, 
    '1' M_SCORE, 
    'At Risk' PRE_SEG_1,
    '0' M_RAW,
    '1' R_SCORE,
    'Hibernating customers' SEGMENT,
    '-69' TIME_AS,
    '2022-02-07' FIRST_SUCCEEDED_TRANSACTION_DATE,
    '1' SEGMENT_NR,
    '173' R_RAW,
    '151' FINAL_SCORE,
    '0' F_RAW,
    'test1@email.com' CUSTOMER_ID,
    '5' F_SCORE,
    '2022-05-29' SNAPSHOT_DATE 
  WHERE (SELECT COUNT(*) FROM "bdmRfm") = 0

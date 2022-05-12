ALTER TABLE "bdmRfm" DROP COLUMN "_timestamp";

CREATE TABLE "bdmRfmEnrich" as (
select r.* from "bdmRfm" r
join (SELECT "CUSTOMER_ID", max("SNAPSHOT_DATE") "SNAPSHOT_DATE" from "bdmRfm" group by "CUSTOMER_ID") l
ON r."CUSTOMER_ID" = l."CUSTOMER_ID" and r."SNAPSHOT_DATE" = l."SNAPSHOT_DATE");

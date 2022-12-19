CREATE OR REPLACE TABLE "out_users" as 
select distinct
    "kbc_project_id",
    "user_id",
    "email",
    "domain",
    min("valid_from"::date) as "valid_from",
    max("snapshot_time"::date) as "valid_to"
from "kbc_project_user"
group by 1,2,3,4;
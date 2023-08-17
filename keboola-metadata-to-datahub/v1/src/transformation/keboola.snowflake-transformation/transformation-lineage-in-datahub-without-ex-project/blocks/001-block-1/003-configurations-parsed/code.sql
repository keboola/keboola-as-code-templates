create or replace table "configurations_parsed" as
select c.*,
    p."kbc_project" as "project_name"
from (
        select *
        from "rows_json" c
        union all
        select *
        from "configuration_json" c
    ) as c
    left join "kbc_project" p ON p."kbc_project_id_num" = c."project_id";
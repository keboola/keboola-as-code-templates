create or replace table "configurations_parsed" as
select 
  *
from 
  "rows_json" c 
 
 
UNION ALL

select 
  *
from 
  "configuration_json" c;

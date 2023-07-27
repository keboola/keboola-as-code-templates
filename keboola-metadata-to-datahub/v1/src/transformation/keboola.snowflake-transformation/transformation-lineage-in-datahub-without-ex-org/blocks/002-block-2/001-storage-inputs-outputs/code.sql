create or replace table "storage_inputs_and_outputs" as

with storage_inputs_sources as (
  select 
    "id", 
    "region", 
    "project_id", 
    "name", 
    "component_id", 
    "component_name", 
    "component_type", 
    config_path, 
    CASE WHEN config_path LIKE 'storage.input.tables[%].source' 
    and config_path not like '%column%' THEN array_agg(config_value) END AS storage_inputs_sources 
  from 
    "configurations_parsed" 
    --where path LIKE 'storage.input.tables[%].source' and path not like '%column%'--or path = 'storage.output.tables'
  group by 
    1, 
    2, 
    3, 
    4, 
    5, 
    6, 
    7, 
    8
), 
storage_inputs_destinations as (
  select 
    "id", 
    "region", 
    "project_id", 
    "name", 
    "component_id", 
    "component_name", 
    "component_type", 
    config_path, 
    CASE WHEN config_path LIKE 'storage.input.tables[%].destination' 
    and config_path not like '%column%' THEN array_agg(config_value) END AS storage_inputs_destinations 
  from 
    "configurations_parsed"
  group by 
    1, 
    2, 
    3, 
    4, 
    5, 
    6, 
    7, 
    8
),
 storage_outputs_sources as (
  select 
    "id", 
    "region", 
    "project_id", 
    "name", 
    "component_id", 
    "component_name", 
    "component_type", 
    config_path, 
    CASE WHEN config_path LIKE 'storage.output.tables[%].source' 
    and config_path not like '%column%' THEN array_agg(config_value) END AS storage_outputs_sources 
  from 
    "configurations_parsed" 
    --where path LIKE 'storage.input.tables[%].source' and path not like '%column%'--or path = 'storage.output.tables'
  group by 
    1, 
    2, 
    3, 
    4, 
    5, 
    6, 
    7, 
    8
), 
storage_outputs_destinations as (
  select 
    "id", 
    "region", 
    "project_id", 
    "name", 
    "component_id", 
    "component_name", 
    "component_type", 
    config_path, 
    CASE WHEN config_path LIKE 'storage.output.tables[%].destination' 
    and config_path not like '%column%' THEN array_agg(config_value) END AS storage_outputs_destinations 
  from 
    "configurations_parsed" --where path LIKE 'storage.input.tables[%].source' and path not like '%column%'--or path = 'storage.output.tables'
  group by 
    1, 
    2, 
    3, 
    4, 
    5, 
    6, 
    7, 
    8
) 
select 
  "id", 
  "region", 
  "project_id", 
  "name", 
  "component_id", 
  "component_name", 
  "component_type", 
   ARRAY_TO_STRING( storage_inputs_sources , ',' ) as storage_inputs_sources, 
  ARRAY_TO_STRING(storage_inputs_destinations, ',') as storage_inputs_destinations,
  ARRAY_TO_STRING(storage_outputs_sources, ',') as storage_outputs_sources,
  ARRAY_TO_STRING(storage_outputs_destinations, ',') as storage_outputs_destinations
from 
  storage_inputs_sources 
  left join storage_inputs_destinations using(
    "id", "region", "project_id", "name", 
    "component_id", "component_name", 
    "component_type", config_path
  ) 
  left join storage_outputs_sources using(
    "id", "region", "project_id", "name", 
    "component_id", "component_name", 
    "component_type", config_path
  ) 
  left join storage_outputs_destinations using(
    "id", "region", "project_id", "name", 
    "component_id", "component_name", 
    "component_type", config_path
  )

where STORAGE_INPUTS_SOURCES is not null or STORAGE_OUTPUTS_DESTINATIONS is not null

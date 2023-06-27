create or replace table "temp_storage_inputs_and_outputs" as

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

where STORAGE_INPUTS_SOURCES is not null or STORAGE_OUTPUTS_DESTINATIONS is not null;

CREATE OR REPLACE TABLE "storage_inputs_and_outputs" AS
SELECT 
  s."id",
  s."region",
  s."project_id",
  s."project_name",
  s."name",
  s."component_id",
  s."component_name",
  s."component_type",
  CASE WHEN s1."source_table_id" IS NOT NULL AND s1."source_table_id" <> ''  THEN SUBSTRING(s1."source_table_id",CHARINDEX('.',s1."source_table_id")+1) ELSE SUBSTRING(s.storage_inputs_sources,CHARINDEX('.',s.storage_inputs_sources)+1) END AS storage_inputs_sources,
  CASE WHEN s2."source_table_id" IS NOT NULL AND s2."source_table_id" <> ''  THEN SUBSTRING(s2."source_table_id",CHARINDEX('.',s2."source_table_id")+1) ELSE SUBSTRING(s.storage_inputs_destinations,CHARINDEX('.',s.storage_inputs_destinations)+1) END AS storage_inputs_destinations,
  CASE WHEN s3."source_table_id" IS NOT NULL AND s3."source_table_id" <> ''  THEN SUBSTRING(s3."source_table_id",CHARINDEX('.',s3."source_table_id")+1) ELSE SUBSTRING(s.storage_outputs_sources,CHARINDEX('.',s.storage_outputs_sources)+1) END AS storage_outputs_sources,
  CASE WHEN s4."source_table_id" IS NOT NULL AND s4."source_table_id" <> ''  THEN SUBSTRING(s4."source_table_id",CHARINDEX('.',s4."source_table_id")+1) ELSE SUBSTRING(s.storage_outputs_destinations,CHARINDEX('.',s.storage_outputs_destinations)+1) END AS storage_outputs_destinations 
FROM "temp_storage_inputs_and_outputs" s
LEFT JOIN "tables" s1 
    ON s.storage_inputs_sources = s1."id"
LEFT JOIN "tables" s2 
    ON s.storage_inputs_destinations = s2."id"
LEFT JOIN "tables" s3 
    ON s.storage_outputs_sources = s3."id"
LEFT JOIN "tables" s4 
    ON s.storage_outputs_destinations = s4."id";

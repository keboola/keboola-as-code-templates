CREATE TABLE "storage_inputs_and_outputs" AS

WITH storage_inputs_sources AS (
  SELECT 
    cp."id", 
    cp."region", 
    cp."project_id", 
  	p."kbc_project" as "project_name",
    cp."name", 
    cp."component_id", 
    cp."component_name", 
    cp."component_type", 
    config_path, 
    CASE WHEN config_path LIKE 'storage.input.tables[%].source' 
    AND config_path NOT LIKE '%column%' THEN array_agg(config_value) END AS storage_inputs_sources 
  FROM 
    "configurations_parsed" cp
  LEFT JOIN "kbc_project" p ON cp."project_id" = p."kbc_project_id_num"
    --where path LIKE 'storage.input.tables[%].source' and path NOT LIKE '%column%'--or path = 'storage.output.tables'
  GROUP BY 
    1, 
    2, 
    3, 
    4, 
    5, 
    6, 
    7, 
    8,
  	9
), 
storage_inputs_destinations AS (
  SELECT 
    cp."id", 
    cp."region", 
    cp."project_id", 
  	p."kbc_project" as "project_name",
    cp."name", 
    cp."component_id", 
    cp."component_name", 
    cp."component_type", 
    config_path, 
    CASE WHEN config_path LIKE 'storage.input.tables[%].destination' 
    AND config_path NOT LIKE '%column%' THEN array_agg(config_value) END AS storage_inputs_destinations 
  FROM 
    "configurations_parsed" cp
  LEFT JOIN "kbc_project" p ON cp."project_id" = p."kbc_project_id_num"
  GROUP BY 
    1, 
    2, 
    3, 
    4, 
    5, 
    6, 
    7, 
    8,
  	9
),
 storage_outputs_sources AS (
  SELECT 
    cp."id", 
    cp."region", 
    cp."project_id", 
  	p."kbc_project" as "project_name",
    cp."name", 
    cp."component_id", 
    cp."component_name", 
    cp."component_type",  
    config_path, 
    CASE WHEN config_path LIKE 'storage.output.tables[%].source' 
    AND config_path NOT LIKE '%column%' THEN array_agg(config_value) END AS storage_outputs_sources 
  FROM 
    "configurations_parsed" cp
  LEFT JOIN "kbc_project" p ON cp."project_id" = p."kbc_project_id_num"
    --where path LIKE 'storage.input.tables[%].source' and path NOT LIKE '%column%'--or path = 'storage.output.tables'
  GROUP BY 
    1, 
    2, 
    3, 
    4, 
    5, 
    6, 
    7, 
    8,
    9
), 
storage_outputs_destinations AS (
  SELECT 
    cp."id", 
    cp."region", 
    cp."project_id", 
  	p."kbc_project" as "project_name",
    cp."name", 
    cp."component_id", 
    cp."component_name", 
    cp."component_type",  
    config_path, 
    CASE WHEN config_path LIKE 'storage.output.tables[%].destination' 
    AND config_path NOT LIKE '%column%' THEN array_agg(config_value) END AS storage_outputs_destinations 
  FROM 
    "configurations_parsed" cp
  LEFT JOIN "kbc_project" p ON cp."project_id" = p."kbc_project_id_num"
--where path LIKE 'storage.input.tables[%].source' and path NOT LIKE '%column%'--or path = 'storage.output.tables'
  GROUP BY 
    1, 
    2, 
    3, 
    4, 
    5, 
    6, 
    7, 
    8,
  	9
) 
SELECT 
  "id", 
  "region", 
  "project_id", 
  "project_name",
  "name", 
  "component_id", 
  "component_name", 
  "component_type", 
   ARRAY_TO_STRING( storage_inputs_sources , ',' ) as storage_inputs_sources, 
  ARRAY_TO_STRING(storage_inputs_destinations, ',') as storage_inputs_destinations,
  ARRAY_TO_STRING(storage_outputs_sources, ',') as storage_outputs_sources,
  ARRAY_TO_STRING(storage_outputs_destinations, ',') as storage_outputs_destinations
FROM 
  storage_inputs_sources 
  LEFT JOIN storage_inputs_destinations USING(
    "id", "region", "project_id", "project_name", "name", 
    "component_id", "component_name", 
    "component_type", config_path
  ) 
  LEFT JOIN storage_outputs_sources USING(
    "id", "region", "project_id", "project_name", "name", 
    "component_id", "component_name", 
    "component_type", config_path
  ) 
  LEFT JOIN storage_outputs_destinations USING(
    "id", "region", "project_id", "project_name", "name", 
    "component_id", "component_name", 
    "component_type", config_path
  )

WHERE STORAGE_INPUTS_SOURCES is not null or STORAGE_OUTPUTS_DESTINATIONS is not null;
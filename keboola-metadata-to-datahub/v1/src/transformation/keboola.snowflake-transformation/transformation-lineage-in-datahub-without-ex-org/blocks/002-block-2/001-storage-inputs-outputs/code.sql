CREATE OR REPLACE TABLE "temp_storage_inputs_and_outputs" AS
WITH storage_inputs_sources AS (
  SELECT 
    "id", 
    "region", 
    "project_id", 
  	"project_name",
    "name", 
    "component_id", 
    "component_name", 
    "component_type", 
    config_path, 
    CASE WHEN config_path LIKE '%storage.input.tables[%].source' 
    AND config_path NOT LIKE '%column%' THEN array_agg(config_value) END AS storage_inputs_sources 
  FROM 
    "configurations_parsed" 
    --where path LIKE 'storage.input.tables[%].source' and path not like '%column%'--or path = 'storage.output.tables'
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
    "id", 
    "region", 
    "project_id", 
  	"project_name",
    "name", 
    "component_id", 
    "component_name", 
    "component_type", 
    config_path, 
    CASE WHEN config_path LIKE '%storage.input.tables[%].destination' 
    AND config_path NOT LIKE '%column%' THEN array_agg(config_value) END AS storage_inputs_destinations 
  FROM 
    "configurations_parsed"
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
    "id", 
    "region", 
    "project_id", 
  	"project_name",
    "name", 
    "component_id", 
    "component_name", 
    "component_type", 
    config_path, 
    CASE WHEN config_path LIKE '%storage.output.tables[%].source' 
    AND config_path NOT LIKE '%column%' THEN array_agg(config_value) END AS storage_outputs_sources 
  FROM 
    "configurations_parsed" 
    --where path LIKE 'storage.input.tables[%].source' and path not like '%column%'--or path = 'storage.output.tables'
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
    "id", 
    "region", 
    "project_id", 
  	"project_name",
    "name", 
    "component_id", 
    "component_name", 
    "component_type", 
    config_path, 
    CASE WHEN config_path LIKE '%storage.output.tables[%].destination' 
    AND config_path NOT LIKE '%column%' THEN array_agg(config_value) END AS storage_outputs_destinations 
  FROM 
    "configurations_parsed" --where path LIKE 'storage.input.tables[%].source' and path not like '%column%'--or path = 'storage.output.tables'
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
  //SUBSTRING(ARRAY_TO_STRING( storage_inputs_sources , ',' ), CHARINDEX('.', ARRAY_TO_STRING( storage_inputs_sources , ',')) + 1) as storage_inputs_sources, 
  //SUBSTRING(ARRAY_TO_STRING( storage_inputs_destinations , ',' ), CHARINDEX('.', ARRAY_TO_STRING( storage_inputs_destinations , ',')) + 1) as storage_inputs_destinations, 
  //SUBSTRING(ARRAY_TO_STRING( storage_outputs_sources , ',' ), CHARINDEX('.', ARRAY_TO_STRING( storage_outputs_sources , ',')) + 1) as storage_outputs_sources, 
  //SUBSTRING(ARRAY_TO_STRING( storage_outputs_destinations , ',' ), CHARINDEX('.', ARRAY_TO_STRING( storage_outputs_destinations , ',')) + 1) as storage_outputs_destinations
   ARRAY_TO_STRING( storage_inputs_sources , ',' ) as storage_inputs_sources, 
  ARRAY_TO_STRING(storage_inputs_destinations, ',') as storage_inputs_destinations,
  ARRAY_TO_STRING(storage_outputs_sources, ',') as storage_outputs_sources,
  ARRAY_TO_STRING(storage_outputs_destinations, ',') as storage_outputs_destinations
FROM 
  storage_inputs_sources 
  LEFT JOIN storage_inputs_destinations USING(
    "id", "region", "project_id",
  	"project_name", "name", 
    "component_id", "component_name", 
    "component_type", config_path
  ) 
  LEFT JOIN storage_outputs_sources USING(
    "id", "region", "project_id", 
  	"project_name","name", 
    "component_id", "component_name", 
    "component_type", config_path
  ) 
  LEFT JOIN storage_outputs_destinations USING(
    "id", "region", "project_id", 
  	"project_name","name", 
    "component_id", "component_name", 
    "component_type", config_path
  )

WHERE STORAGE_INPUTS_SOURCES IS NOT NULL OR STORAGE_OUTPUTS_DESTINATIONS IS NOT NULL;

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
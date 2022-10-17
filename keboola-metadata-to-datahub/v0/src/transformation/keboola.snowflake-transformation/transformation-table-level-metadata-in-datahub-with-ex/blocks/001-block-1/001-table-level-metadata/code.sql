create or replace table "table-level-metadata" as
with col_md_temp as (
  SELECT 
    "table_id", 
    "region", 
    "project_id", 
    "column", 
    object_agg(
      (
        concat("provider", '_', "key")
      ), 
      "value" :: variant
    ) over(
      partition by(
        "table_id", "column", "project_id"
      )
    ) as "column_level_md" 
  FROM 
    "tables-columns-metadata"
), 
col_md as(
  select 
    "table_id", 
    "region", 
    "project_id", 
    "column", 
    "column_level_md" 
  from 
    col_md_temp 
  group by 
    1, 
    2, 
    3, 
    4, 
    5
), 
table_md_temp as(
  select 
    tc."table_id", 
    tc."region", 
    tc."project_id", 
    tc."column", 
    cmd."column_level_md" 
  from 
    "tables-columns" tc 
    left join col_md cmd on tc."table_id" = cmd."table_id" 
    and tc."column" = cmd."column" 
    and tc."project_id" = cmd."project_id"
),
tables_md_description as (
select * from "tables-metadata"
where "key" = 'KBC.description'
)
SELECT 
  t."id",
  t."project_id", 
  concat(t."project_id", '.', t."id") as org_table_id,
  t."name",
  tables_md_description."value" as "description",
  t."primary_key",
  t."rows_count",
  t."data_size_bytes",
	t."is_alias",
  t."bucket_id",
  t."bucket_name",
  t."last_import_date",
  t."last_change_date",
  t."source_table_id",
  p."kbc_project" as "project_name",
  array_agg(tmd."column")::varchar as "table_columns",
  array_agg(object_construct(tmd."column", tmd."column_level_md"))::varchar as "table_level_md"
FROM 
  "tables" t
  LEFT JOIN table_md_temp tmd on t."id" = tmd."table_id" and t."project_id" = tmd."project_id"
  LEFT JOIN tables_md_description on t."id" = tables_md_description."table_id"
  LEFT JOIN "kbc_project" p on t."project_id" = p."kbc_project_id_num"
group by 
  1, 
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15

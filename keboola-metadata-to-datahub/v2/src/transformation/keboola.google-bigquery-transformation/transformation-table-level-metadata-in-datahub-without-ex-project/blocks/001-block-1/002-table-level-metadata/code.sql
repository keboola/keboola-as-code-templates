CREATE OR REPLACE TABLE "table-level-metadata" AS 
WITH col_md_temp AS (
    SELECT
        "table_id",
        "region",
        "project_id",
        "column",
        object_agg(
            (concat("provider", '_', "key")),
            "value" :: variant
        ) OVER(
            PARTITION BY (
                "table_id",
                "column",
                "project_id"
            )
        ) AS "column_level_md"
    FROM
        "tables-columns-metadata"
),
col_md AS(
    SELECT
        "table_id",
        "region",
        "project_id",
        "column",
        "column_level_md"
    FROM
        col_md_temp
    GROUP BY
        1,
        2,
        3,
        4,
        5
),
table_md_temp AS(
    SELECT
        tc."table_id",
        tc."region",
        tc."project_id",
        tc."column",
        cmd."column_level_md"
    FROM
        "tables-columns" tc
        LEFT JOIN col_md cmd ON tc."table_id" = cmd."table_id"
        AND tc."column" = cmd."column"
        AND tc."project_id" = cmd."project_id"
),
tables_md_description AS (
    SELECT
        *
    FROM
        "tables-metadata"
    WHERE
        "key" = 'KBC.description'
),
upstream_config_lineage AS (
    SELECT
        "table_id",
        table_md."project_id",
        "value" as "configuration_id",
        configs."name",
        configs."component_type"
    FROM
        "tables-metadata" table_md
        LEFT JOIN "configurations" configs ON "configuration_id" = configs."id"
    WHERE
        "key" = 'KBC.lastUpdatedBy.configuration.id'
    GROUP BY
        "table_id",
        table_md."project_id",
        "value",
        configs."name",
        configs."component_type"
)
SELECT
    t."id",
    t."project_id",
    concat(t."project_id", '.', t."id") AS org_table_id,
    t."name",
    CASE
        WHEN tables_md_description."value" IS NULL THEN ''
        ELSE tables_md_description."value"
    END AS "description",
    t."primary_key",
    t."rows_count",
    t."data_size_bytes",
    t."is_alias",
    CASE
        WHEN dev."is_default" = 'false' THEN 'False'
        ELSE 'True'
    END AS "is_default",
    t."bucket_id",
    t."bucket_name",
    t."last_import_date",
    t."last_change_date",
    t."source_table_id",
    t."source_table_project_id",
    p."kbc_project" AS "project_name",
    coalesce(
        NotAlias_upstream_lineage."configuration_id",
        Alias_upstream_lineage."configuration_id"
    ) AS "upstream_lineage_confg_id",
    coalesce(
        NotAlias_upstream_lineage."name",
        Alias_upstream_lineage."name"
    ) AS "upstream_lineage_config_name",
    array_agg(tmd."column")::varchar AS "table_columns",
    array_agg(
        object_construct(
            tmd."column",
            tmd."column_level_md"))::varchar AS "table_level_md"
            FROM
                "tables" t
                LEFT JOIN table_md_temp tmd ON t."id" = tmd."table_id"
                AND t."project_id" = tmd."project_id"
                LEFT JOIN tables_md_description ON t."id" = tables_md_description."table_id"
                LEFT JOIN "kbc_project" p ON t."project_id" = p."kbc_project_id_num"
                LEFT JOIN "dev_branch_buckets" dev ON t."project_id" = dev."project_id"
                AND t."bucket_id" = dev."id"
                LEFT JOIN upstream_config_lineage NotAlias_upstream_lineage ON t."id" = NotAlias_upstream_lineage."table_id"
                AND t."project_id" = NotAlias_upstream_lineage."project_id"
                LEFT JOIN upstream_config_lineage Alias_upstream_lineage ON t."source_table_id" = Alias_upstream_lineage."table_id"
                AND t."source_table_project_id" = Alias_upstream_lineage."project_id"
            GROUP BY
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
                15,
                16,
                17,
                18,
                19;
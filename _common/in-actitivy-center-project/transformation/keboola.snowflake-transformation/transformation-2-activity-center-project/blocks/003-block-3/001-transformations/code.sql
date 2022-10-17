CREATE OR REPLACE TABLE "out_transformations_rows" AS
WITH query_count  AS (
    SELECT DISTINCT CONCAT_WS('-',"transformation_id", "region") AS "transformation_id",
                    COUNT(*)                                        AS "query_count",
                    REGEXP_COUNT(LISTAGG("script", '\n'), '\n') + 1  AS "query_rows"
    FROM "transformations-queries"
    GROUP BY 1
),
     input_count  AS (
         SELECT DISTINCT CONCAT_WS('-',"transformation_id", "region") AS "transformation_id",
                         COUNT(*)                                        AS "inputs_count",
                         SUM(IFF("is_used"::BOOLEAN = FALSE, 1, 0))      AS "unused_inputs_count"
         FROM "analyser-inputs"
         GROUP BY 1
     ),
     output_count AS (
         SELECT CONCAT_WS('-',"transformation_id", "region") AS "transformation_id",
                COUNT(*)                                        AS "outputs_count"
         FROM "transformations-outputs"
         GROUP BY 1
     )
SELECT CONCAT_WS('-', "project_id", t."region",
                 'transformation', t."id")               										  AS "transformation_row_id",
      CONCAT_WS('-',"id", "region")                                    AS "transformation_id",
       CONCAT('https://connection.',t."region", '/admin/projects/', "project_id",
              '/transformations-v2/', "component_id",'/',
              "id")                                                     		  AS "transformation_url",
       "name"                                                                 AS "transformation_name",
       "description"                                                          AS "transformation_description",
       IFF("description" <> '' OR "description" IS  NULL,
           TRUE, FALSE)                                                       AS "transformation_has_description",
       SUM(ZEROIFNULL(ti."inputs_count"))                                     AS "transformation_number_of_inputs",
       IFF(SUM(ZEROIFNULL(ti."unused_inputs_count")) > 0, TRUE, FALSE)        AS "transformation_has_unused_inputs",
       SUM(ZEROIFNULL(tp."outputs_count"))                                    AS "transformation_number_of_outputs",
       SUM(ZEROIFNULL(tq."query_count"))                                      AS "transformation_number_of_queries",
       SUM(ZEROIFNULL(tq."query_rows"))                                       AS "transformation_number_of_lines"
FROM "transformations" t
     LEFT JOIN query_count tq ON tq."transformation_id" = CONCAT_WS('-',"id", "region")
     LEFT JOIN input_count ti ON ti."transformation_id" = CONCAT_WS('-',"id", "region")
     LEFT JOIN output_count tp ON tp."transformation_id" = CONCAT_WS('-',"id", "region")
GROUP BY t."project_id",
         t."region",
         t."id",
         t."name",
         t."description",
         t."component_id";

CREATE OR REPLACE TABLE "out_transformations_inputs" AS
SELECT CONCAT_WS('-',"transformation_id", "region") AS "transformation_id",
       "source"                                        AS "input_source",
       "destination"                                   AS "input_destination",
       "is_used"                                       AS "input_is_used"
FROM "analyser-inputs";
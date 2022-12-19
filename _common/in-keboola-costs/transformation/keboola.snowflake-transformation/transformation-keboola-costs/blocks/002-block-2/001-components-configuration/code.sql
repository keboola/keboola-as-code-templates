----------------------------------------------------------------------------------------------------------------
-------------------------------------------OUT_COMPONENTS-------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE TABLE 
    "out_components"        
AS
SELECT DISTINCT 
                kcc."kbc_component_id"              AS "component_id",
                kcc."kbc_component"                 AS "component_name",
                kcc."kbc_component_type"            AS "component_type",
                kcc."kbc_component_listing"         AS "component_listing",
                kcc."kbc_component_vendor"          AS "component_vendor",
                CASE
                    WHEN 
                        kcc."kbc_component_vendor" 
                        IN ('keboola', 'kds-team')
                    THEN 
                        'keboola'
                    ELSE 
                        '3rd Party' 
                END                                 AS "component_origin"
                    
FROM 
    "kbc_component_configuration" kcc;

----------------------------------------------------------------------------------------------------------------
---------------------------------------OUT_CONFIGURATIONS-------------------------------------------------------
----------------------------------------------------------------------------------------------------------------


CREATE OR REPLACE TABLE 
    "out_configurations" 
AS
SELECT DISTINCT 
                kcc."kbc_component_configuration_id"                          AS "component_configuration_id",
                kcc."kbc_project_id"                                          AS "project_id",
                kcc."kbc_component_id"                                        AS "component_id",
                kcc."kbc_component_configuration"                             AS "configuration_name",
                kcc."kbc_component_configuration_url"                         AS "configuration_url",
                "configuration_id_num" || '-AZURE_EU'                         AS "configuration_id",
                kcc."kbc_configuration_is_deleted"                            AS "configuration_is_deleted",
                kccv."configuration_updated_at"                               AS "configuration_last_updated",
                kccv."configuration_version"::INT                             AS "configuration_last_version",
                kccv."token_id" || '-AZURE_EU'                                AS "last_update_token_id",
                kccv."token_name"                                             AS "last_update_token_name",
                kccv1."configuration_updated_at"                              AS "configuration_created",
                kccv1."token_id" || '-AZURE_EU'                               AS "creator_token_id",
                kccv1."token_name"                                            AS "creator_token_name"
FROM "kbc_component_configuration" kcc
         LEFT JOIN "kbc_component_configuration_version" kccv
                   ON TRUE
                       AND kcc."kbc_component_configuration_id" = kccv."kbc_component_configuration_id"
                       AND kccv."last_version"::BOOLEAN = TRUE
         LEFT JOIN "kbc_component_configuration_version" kccv1
                   ON TRUE
                       AND kcc."kbc_component_configuration_id" = kccv1."kbc_component_configuration_id"
                       AND kccv1."configuration_version" = 1;

----------------------------------------------------------------------------------------------------------------
------------------------------------OUT_CONFIGURATIONS_VERSIONS-------------------------------------------------
----------------------------------------------------------------------------------------------------------------

CREATE TABLE 
    "out_configurations_versions" 
AS
SELECT 
       CONCAT_WS('-', 
                v."kbc_component_configuration_id",
                 v."configuration_version")                      AS "component_configuration_version_id",
       v."kbc_component_configuration_id"                        AS "component_configuration_id",
       "configuration_version"                                   AS "configuration_version",
       v."configuration_updated_at"                              AS "configuration_version_updated",
       "last_version"                                            AS "configuration_version_is_last",
       "change_description"                                      AS "configuration_version_description",
       v."token_id" || '-AZURE_EU'                               AS "token_id",
       v."token_name"                                            AS "token_name",
       CASE
           WHEN "configuration_version"::INT = 1 THEN 'created'
           WHEN "change_description" = 'Configuration deleted'  THEN 'deleted'
           WHEN "change_description" = 'Configuration restored' THEN 'restored'
           ELSE 'changed'
           END                                                   AS "configuration_version_event"
FROM "kbc_component_configuration_version" v
         LEFT JOIN "kbc_component_configuration" c
                   ON c."kbc_component_configuration_id" = v."kbc_component_configuration_id";

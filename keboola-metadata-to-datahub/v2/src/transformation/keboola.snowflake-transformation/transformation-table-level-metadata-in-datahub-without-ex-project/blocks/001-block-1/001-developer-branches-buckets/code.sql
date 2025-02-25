-- dev branches are signified by "is_default" = false
CREATE OR REPLACE TABLE "dev_branch_buckets" AS
SELECT
    "project_id",
    "region",
    "id",
    "name",
    "displayName",
    split("id", '-') as id_split,
    concat(
        to_varchar(try_to_decimal(as_char(split("id", '-') [1]))),
        '_',
        'kbc-',
        split("region", '.') [0]
    ) as "branch_id",
    "is_default",
    "stage",
    "created",
    "lastChangeDate",
    "isReadOnly",
    "isMaintenance",
    "backend",
    "sharing",
    "directAccessEnabled",
    "directAccessSchemaName",
    "sourceBucket__id",
    "sourceBucket__name",
    "sourceBucket__displayName",
    "sourceBucket__stage",
    "sourceBucket__description",
    "sourceBucket__sharing",
    "sourceBucket__created"
FROM
    "storage_buckets" sb
    LEFT JOIN "kbc_branch" br ON "branch_id" = br."kbc_branch_id";
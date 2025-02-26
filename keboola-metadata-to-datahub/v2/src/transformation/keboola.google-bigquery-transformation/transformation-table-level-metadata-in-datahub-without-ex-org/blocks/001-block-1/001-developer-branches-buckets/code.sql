/* dev branches are signified by "is_default" = false */
CREATE OR REPLACE TABLE `dev_branch_buckets` AS
SELECT
  `project_id`,
  `region`,
  `id`,
  `name`,
  `displayName`,
  SPLIT(`id`, '-') AS id_split,
  CONCAT(
    CAST(try_to_decimal(as_char(SPLIT(`id`, '-')[1])) AS STRING),
    '_',
    'kbc-',
    SPLIT(`region`, '.')[0]
  ) AS `branch_id`,
  `is_default`,
  `stage`,
  `created`,
  `lastChangeDate`,
  `isReadOnly`,
  `isMaintenance`,
  `backend`,
  `sharing`,
  `directAccessEnabled`,
  `directAccessSchemaName`,
  `sourceBucket__id`,
  `sourceBucket__name`,
  `sourceBucket__displayName`,
  `sourceBucket__stage`,
  `sourceBucket__description`,
  `sourceBucket__sharing`,
  `sourceBucket__created`
FROM `storage_buckets` AS sb
LEFT JOIN `kbc_branch` AS br
  ON `branch_id` = br.`kbc_branch_id`
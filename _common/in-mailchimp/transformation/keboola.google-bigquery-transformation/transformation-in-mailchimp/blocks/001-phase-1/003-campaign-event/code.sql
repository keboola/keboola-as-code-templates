/* create output table with campaign events */ /* convert timestamp to datetime */
CREATE TABLE `campaign_event_out` (
  `campaign_event_id` STRING(255) NOT NULL,
  `campaign_id` STRING(255),
  `list_id` STRING(255),
  `campaign_event_type` STRING(255),
  `campaign_event_date` DATETIME
);

INSERT INTO `campaign_event_out`
SELECT
  `id` || '_sent' AS `campaign_event_id`,
  `id` AS `campaign_id`,
  `recipients_list_id` AS `list_id`,
  'sent' AS `campaign_event_type`,
  IF(`send_time` = '', '', CAST(TO_TIMESTAMP_NTZ(`send_time`) AS STRING)) AS `campaign_event_date`
FROM `campaigns`
WHERE
  `send_time` <> ''
UNION ALL
SELECT
  `id` || '_created' AS `campaign_event_id`,
  `id` AS `campaign_id`,
  `recipients_list_id` AS `list_id`,
  'created' AS `campaign_event_type`,
  IF(`create_time` = '', '', CAST(TO_TIMESTAMP_NTZ(`create_time`) AS STRING)) AS `campaign_event_date`
FROM `campaigns`
WHERE
  `create_time` <> '';
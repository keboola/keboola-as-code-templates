/* create output activity table */ /* use only activity related to either contact/lead or opportunity */ /* format datetime */ /* convert duration to minutes */ /* using the first contact/opportunity/employee ID in array from activities table for joins */
CREATE TABLE `out_activity` (
  `activity_id` STRING(2000) NOT NULL,
  `employee_id` STRING(2000),
  `contact_id` STRING(2000),
  `opportunity_id` STRING(2000),
  `activity` STRING(2000),
  `activity_date` DATETIME,
  `activity_duration_m` FLOAT64
)
INSERT INTO `out_activity`
SELECT
  `a`.`engagement_id` AS `activity_id`,
  COALESCE(`e`.`employee_id`, '0') AS `employee_id`,
  COALESCE(`c`.`contact_id`, '0') AS `contact_id`,
  COALESCE(`o`.`opportunity_id`, '0') AS `opportunity_id`,
  IF(
    LENGTH(`a`.`metadata_subject`) > 1028,
    LEFT(`a`.`metadata_subject`, 1025) || '...',
    `a`.`metadata_subject`
  ) AS `activity`,
  TO_TIMESTAMP_NTZ(`a`.`engagement_createdAt`) AS `activity_date`,
  CAST((
    IF(
      `a`.`metadata_durationMilliseconds` = '',
      NULL,
      `a`.`metadata_durationMilliseconds` / 60000
    )
  ) AS FLOAT64) AS `activity_duration_m`
FROM `activities` AS `a`
LEFT JOIN `out_contact` AS `c`
  ON SPLIT_PART(REPLACE(REPLACE(`a`.`associations_contactIds`, ']', ''), '[', ''), ',', 0) || '_contact' = `c`.`contact_id`
LEFT JOIN `out_opportunity` AS `o`
  ON SPLIT_PART(REPLACE(REPLACE(`a`.`associations_dealIds`, ']', ''), '[', ''), ',', 0) = `o`.`opportunity_id`
LEFT JOIN `out_employee` AS `e`
  ON SPLIT_PART(REPLACE(REPLACE(`a`.`associations_ownerIds`, ']', ''), '[', ''), ',', 0) = `e`.`employee_id`
WHERE
  (
    NOT `c`.`contact_id` IS NULL OR NOT `o`.`opportunity_id` IS NULL
  )
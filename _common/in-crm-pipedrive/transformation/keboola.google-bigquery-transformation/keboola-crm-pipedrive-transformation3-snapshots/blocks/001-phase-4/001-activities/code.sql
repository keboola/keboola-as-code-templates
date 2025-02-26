/* create output activity table */ /* use only activity related to either contact/lead or opportunity */ /* format datetime */
CREATE TABLE `out_activity` (
  `activity_id` STRING(2000) NOT NULL,
  `employee_id` STRING(2000),
  `contact_id` STRING(2000),
  `opportunity_id` STRING(2000),
  `activity` STRING(2000),
  `activity_date` DATETIME,
  `activity_duration_m` STRING(255)
);

INSERT INTO `out_activity`
SELECT
  `a`.`activity_id` AS `activity_id`,
  COALESCE(`e`.`employee_id`, '0') AS `employee_id`,
  COALESCE(`c`.`contact_id`, '0') AS `contact_id`,
  COALESCE(`o`.`opportunity_id`, '0') AS `opportunity_id`,
  IF(LENGTH(`a`.`subject`) > 1028, LEFT(`a`.`subject`, 1025) || '...', `a`.`subject`) AS `activity`,
  CAST(TO_TIMESTAMP_NTZ(`a`.`due_date`) AS STRING) AS `activity_date`,
  '' AS `activity_duration_m`
FROM `activities` AS `a`
LEFT JOIN `contact` AS `c`
  ON `a`.`person_id` = `c`.`contact_id`
LEFT JOIN `opportunity` AS `o`
  ON `a`.`deal_id` = `o`.`opportunity_id`
LEFT JOIN `employee` AS `e`
  ON `a`.`user_id` = `e`.`employee_id`
WHERE
  (
    NOT `c`.`contact_id` IS NULL OR NOT `o`.`opportunity_id` IS NULL
  );
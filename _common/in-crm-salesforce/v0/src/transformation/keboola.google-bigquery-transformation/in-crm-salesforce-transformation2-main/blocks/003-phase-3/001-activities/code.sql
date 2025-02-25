/* create output activity table */ /* use only activity related to either contact/lead or opportunity */ /* format datetime */
CREATE TABLE `out_activity` (
  `activity_id` STRING(2000) NOT NULL,
  `employee_id` STRING(2000),
  `contact_id` STRING(2000),
  `opportunity_id` STRING(2000),
  `activity` STRING(2000),
  `activity_date` DATETIME,
  `activity_duration_m` STRING(255)
)
INSERT INTO `out_activity`
SELECT
  `a`.`Id` AS `activity_id`,
  COALESCE(`e`.`employee_id`, '0') AS `employee_id`,
  COALESCE(`c`.`contact_id`, '0') AS `contact_id`,
  COALESCE(`o`.`opportunity_id`, '0') AS `opportunity_id`,
  `a`.`Subject` AS `activity`,
  replace(SPLIT_PART(`a`.`ActivityDateTime`, '.', 1), 'T', ' ') AS `activity_date`,
  `a`.`DurationInMinutes` AS `activity_duration_m`
FROM `event` AS `a`
LEFT JOIN `out_contact` AS `c`
  ON `a`.`WhoId` = `c`.`contact_id`
LEFT JOIN `out_opportunity` AS `o`
  ON `a`.`WhatId` = `o`.`opportunity_id`
LEFT JOIN `out_employee` AS `e`
  ON `a`.`OwnerId` = `e`.`employee_id`
WHERE
  (
    NOT `c`.`contact_id` IS NULL OR NOT `o`.`opportunity_id` IS NULL
  )
  AND LOWER(`a`.`IsDeleted`) = 'false'
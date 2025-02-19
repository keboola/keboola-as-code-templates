/* create output table with employees */
CREATE TABLE `out_employee` (
  `employee_id` STRING(2000) NOT NULL,
  `employee` STRING(255),
  `email` STRING(255),
  `position` STRING(255)
)
INSERT INTO `out_employee`
SELECT
  `owner_id` AS `employee_id`,
  `owner_name` AS `employee`,
  `owner_email` AS `email`,
  '' AS `position`
FROM `users`
/* fake row to keep referential integrity if child tables are missing existing employee ids */
INSERT INTO `out_employee` (
  `employee_id`,
  `employee`,
  `email`,
  `position`
)
VALUES
  ('0', 'Unknown', '', '')
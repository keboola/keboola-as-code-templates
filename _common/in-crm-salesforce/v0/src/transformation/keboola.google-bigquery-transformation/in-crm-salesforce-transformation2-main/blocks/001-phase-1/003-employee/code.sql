/* create output table with employees */
CREATE TABLE `out_employee` (
  `employee_id` STRING(2000) NOT NULL,
  `employee` STRING(255),
  `email` STRING(255),
  `position` STRING(255)
)
INSERT INTO `out_employee`
SELECT
  `Id` AS `employee_id`,
  `Name` AS `employee`,
  `Email` AS `email`,
  `Title` AS `position`
FROM `user`
/* fake row to keep referential integrity if child tables are missing existing employee ids */
INSERT INTO `out_employee` (
  `employee_id`,
  `employee`,
  `email`,
  `position`
)
VALUES
  ('0', 'Unknown', '', '')
CREATE TABLE `configurations_parsed` AS
SELECT
  *
FROM `rows_json` AS c
UNION ALL
SELECT
  *
FROM `configuration_json` AS c;
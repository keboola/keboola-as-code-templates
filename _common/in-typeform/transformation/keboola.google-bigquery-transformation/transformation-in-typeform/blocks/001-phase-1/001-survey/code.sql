/* creates a main list of surveys: */
CREATE TABLE `out_survey` (
  `survey_id` STRING NOT NULL,
  `survey_title` STRING,
  `survey_nickname` STRING
);

INSERT INTO `out_survey`
SELECT
  `id` AS `survey_id`,
  `title` AS `survey_title`,
  '' AS `survey_nickname` /* missing field in TypeForm dataset */
FROM `form`;
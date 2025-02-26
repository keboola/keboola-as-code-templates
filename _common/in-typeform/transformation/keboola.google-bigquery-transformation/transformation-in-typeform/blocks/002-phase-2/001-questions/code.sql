/* creates a list of all Questions asked in the survey */ /* question_position identifies the order of questions within the survey */ /* question_family and question_subtype could be useful for aggregating data */
CREATE TABLE `out_question` (
  `question_id` STRING NOT NULL,
  `survey_id` STRING,
  `survey_title` STRING,
  `question_heading` STRING,
  `description` STRING,
  `question_position` STRING,
  `question_family` STRING,
  `question_subtype` STRING,
  `question_is_visible` STRING
);

INSERT INTO `out_question`
SELECT
  ff.`fields_id` AS `question_id`,
  f.`id` AS `survey_id`,
  f.`title` AS `survey_title`,
  ff.`fields_title` AS `question_heading`,
  ffp.`description`,
  '' AS `question_position`,
  ff.`fields_type` AS `question_family`,
  ffp.`shape` AS `question_subtype`,
  '' AS `question_is_visible`
FROM `form_fields` AS ff
LEFT JOIN `form` AS f
  ON f.`id` = ff.`form_pk`
/* Questions Properties /includes all the setup details/ */
LEFT JOIN `form_fields_properties` AS ffp
  ON ffp.`form_fields_pk` = ff.`form_fields_properties`;

/* referential integrity clean-up: */
DELETE FROM `out_question`
WHERE
  `survey_id` <> ALL (
    SELECT
      `survey_id`
    FROM `out_survey`
  );
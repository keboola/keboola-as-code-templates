/* The reference for the question the answer relates to. Use the ref value to match answers with questions. The Responses payload only includes ref for the fields where you specified them when you created the form. */
CREATE TABLE `pivot_prep` AS
SELECT
  `field_id`,
  `responses_pk`,
  `choice_label`,
  `choice_other`,
  `choices_label`,
  `choices_other`,
  `date`,
  `email`,
  `file_url`,
  `number`,
  `boolean`,
  `text`,
  `url`
FROM `responses_answers`
CREATE TABLE `responses_pivoted` AS
SELECT
  *
FROM `pivot_prep`
UNPIVOT(response FOR type IN (`choice_label`, `choice_other`, `choices_label`, `choices_other`, `date`, `email`, `file_url`, `number`, `boolean`, `text`, `url`))
DELETE FROM `responses_pivoted`
WHERE
  RESPONSE = ''
CREATE TABLE `out_responses` (
  `response_id` STRING NOT NULL,
  `session_id` STRING,
  `question_id` STRING,
  `answer_option_id` STRING,
  `ip_address` STRING,
  `recipient_id` STRING,
  `date_created` DATE,
  `response_status` STRING,
  `response_text` STRING,
  `type_pivot` STRING,
  `field_type` STRING
)
INSERT INTO `out_responses`
SELECT DISTINCT
  ra.`responses_pk` || '_' || ra.`field_id` AS `response_id`, /*    r."response_id"||'_'|| --Unique ID for the response. Note that response_id values are unique per form but are not unique globally. */ /*    ra."field_id" --The unique id of the form field the answer refers to */ /*    AS "response_id" */
  ra.`responses_pk` AS `session_id`,
  ra.`field_id` AS `question_id`, /*    , '' AS "survey_response_question_id"  */
  oao.`answer_option_id`,
  '' AS `ip_address`,
  '' AS `recipient_id`,
  CAST(r.`landed_at` AS DATE) AS `date_created`,
  '' AS `response_status`,
  rap.`RESPONSE` AS `response_text`,
  rap.`TYPE` AS `type_pivot`,
  ra.`field_type`
/* ? */ /*    , srpqa."tag_data" */ /*    , AS "choice_value" */ /*    , TRY_TO_NUMBER(sdqac."text") as "choice_value_number" */ /*    , sdqar."text" AS "row_value" */ /*    , sdqaco."text" AS "col_value" */ /*    , sdqacoc."text" AS "col_choices_value" */
FROM `responses_answers` AS ra
LEFT JOIN `responses` AS r
  ON r.`response_id` = ra.`responses_pk`
LEFT JOIN `responses_pivoted` AS rap
  ON ra.`field_id` = rap.`field_id` AND ra.`responses_pk` = rap.`responses_pk`
LEFT JOIN `out_answer_option` AS oao
  ON ra.`field_id` = oao.`question_id` AND rap.`RESPONSE` = oao.`choice_text`
/* referential integrity clean-up: */
DELETE FROM `out_responses`
WHERE
  `answer_option_id` <> ALL (
    SELECT
      `answer_option_id`
    FROM `out_answer_option`
  )
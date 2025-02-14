-- Check for max rating values:
-- Select max(cast(steps as INT64)) from `form_fields_properties` where steps <> '';

CREATE OR REPLACE TABLE `rating_values` (value INT64);

INSERT INTO `rating_values`
VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20)
;

CREATE OR REPLACE TABLE `yes_no_values` (value INT64);

INSERT INTO `yes_no_values`
VALUES
(1),
(0);

-- Create an aux table to insert rating options into answer_option table:
CREATE OR REPLACE TABLE `rating_options` AS
SELECT 
    ff.fields_id,
    ff.fields_type,
    ffp.steps,
    ROW_NUMBER() OVER (PARTITION BY ff.fields_id ORDER BY rv.value ASC) AS row_number,
    rv.value
FROM `form_fields` ff
LEFT JOIN `form_fields_properties` ffp ON ffp.form_fields_pk = ff.form_fields_properties
CROSS JOIN `rating_values` rv
WHERE ff.fields_type = 'rating'
;

DELETE FROM `rating_options` WHERE row_number > CAST(steps AS INT64);

-- Create an aux table to insert yes_no options into answer_option table:
CREATE OR REPLACE TABLE `yes_no_options` AS
SELECT
    ff.fields_id,
    ff.fields_type,
    rv.value
FROM `form_fields` ff
LEFT JOIN `form_fields_properties` ffp ON ffp.form_fields_pk = ff.form_fields_properties
CROSS JOIN `yes_no_values` rv
WHERE ff.fields_type = 'yes_no'
;

-- Create a table with all the answer options for every question, including rating and yes_no:
CREATE TABLE `out_answer_option`
(
    answer_option_id STRING NOT NULL,
    question_id STRING,
    question_heading STRING,
    choice_id STRING,
    choice_text STRING,
    field_type STRING
);

INSERT INTO `out_answer_option`
SELECT
    CONCAT(ff.fields_id, '_', IFNULL(ffpc.id,
        CASE
        WHEN ff.fields_type = 'rating' THEN CAST(ro.value AS STRING) -- Inserts rating_option values
        WHEN ff.fields_type = 'yes_no' THEN CAST(yno.value AS STRING) -- Inserts yes_no values
        ELSE '' 
        END)) AS answer_option_id,
    ff.fields_id AS question_id,
    ff.fields_title AS question_heading,
-- Answer Choices Options:
    ffpc.id AS choice_id,
    CASE
        WHEN ff.fields_type = 'rating' THEN CAST(ro.value AS STRING) -- Inserts rating_option values
        WHEN ff.fields_type = 'yes_no' THEN CAST(yno.value AS STRING) -- Inserts yes_no values
        ELSE CAST(ffpc.label AS STRING) -- Inserts multiple_choice values
    		END AS choice_text,
    ff.fields_type AS field_type -- Typeform specific
    
--    , ro."value" AS "rating_options"
--    , yno."value" AS "yes_no_options"

FROM `form_fields` ff
LEFT JOIN `form_fields_properties` ffp ON ffp.form_fields_pk = ff.form_fields_properties
LEFT JOIN `form_fields_properties_choices` ffpc ON ffpc.form_fields_properties_pk = ffp.form_fields_properties_choices
-- Workaround for non-existing answer options in the dataset:
LEFT JOIN `rating_options` ro ON ro.fields_id = ff.fields_id
LEFT JOIN `yes_no_options` yno ON yno.fields_id = ff.fields_id
;

-- Referential integrity clean-up:
DELETE FROM `out_answer_option` WHERE question_id NOT IN (SELECT question_id FROM `out_question`);

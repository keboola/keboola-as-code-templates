-- check for max rating values:
-- select max("steps"::INT) from "form_fields_properties" where "steps" <> '';

create or replace table "rating_values" ("value" INT);

insert into "rating_values" values
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

create or replace table "yes_no_values" ("value" INT);

insert into "yes_no_values" values
(1),
(0)
;

-- create an aux table to insert rating options into answer_option table:
create or replace table "rating_options" as
select 
    ff."fields_id"
    , ff."fields_type"
    , ffp."steps"
    , ROW_NUMBER() OVER (PARTITION BY ff."fields_id" ORDER BY rv."value" ASC) AS "row_number"
    , rv."value"
from "form_fields" ff
left join "form_fields_properties" ffp ON ffp."form_fields_pk" = ff."form_fields_properties"
cross join "rating_values" rv
where ff."fields_type" = 'rating'
;

delete from "rating_options" where "row_number" > "steps"
;

-- create an aux table to insert yes_no options into answer_option table:
create or replace table "yes_no_options" as
select
    ff."fields_id"
    , ff."fields_type"
    , rv."value"
from "form_fields" ff
left join "form_fields_properties" ffp ON ffp."form_fields_pk" = ff."form_fields_properties"
cross join "yes_no_values" rv
where ff."fields_type" = 'yes_no'
;

-- creates table with all the answer options for every question, including rating and yes_no:
CREATE TABLE "out_answer_option" AS
SELECT
    ff."fields_id"||'_'||IFNULL(ffpc."id",
        CASE
        WHEN ff."fields_type" = 'rating' THEN ro."value"::VARCHAR --inserts rating_option values
        WHEN ff."fields_type" = 'yes_no' THEN yno."value"::VARCHAR --inserts yes_no values
        ELSE '' 
        END) AS "answer_option_id"
    , ff."fields_id" AS "question_id"
    , ff."fields_title" AS "question_heading" 
-- Answer Choices Options:
    , ffpc."id" AS "choice_id"
    , CASE
        WHEN ff."fields_type" = 'rating' THEN ro."value"::VARCHAR --inserts rating_option values
        WHEN ff."fields_type" = 'yes_no' THEN yno."value"::VARCHAR --inserts yes_no values
        ELSE ffpc."label"::VARCHAR --inserts multiple_choice values
        END AS "choice_text"
    , ff."fields_type" AS "field_type" --Typeform specific

--    , ro."value" AS "rating_options"
--    , yno."value" AS "yes_no_options"

FROM "form_fields" ff
LEFT JOIN "form_fields_properties" ffp ON ffp."form_fields_pk" = ff."form_fields_properties"
LEFT JOIN "form_fields_properties_choices" ffpc ON ffpc."form_fields_properties_pk" = ffp."form_fields_properties_choices"
--workaround for non-existing answer options in the dataset:
LEFT JOIN "rating_options" ro ON ro."fields_id" = ff."fields_id"
LEFT JOIN "yes_no_options" yno ON yno."fields_id" = ff."fields_id"
;

-- referential integrity clean-up:
DELETE FROM "out_answer_option" WHERE "question_id" NOT IN (SELECT "question_id" FROM "out_question");

-- creates a main list of surveys:
CREATE TABLE "out_survey" AS
SELECT
    "id" AS "survey_id"
    , "title" AS "survey_title"
    , '' AS "survey_nickname" -- missing field in TypeForm dataset

FROM "form"
;

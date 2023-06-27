-- creates a main list of surveys:
CREATE TABLE "out_survey"
(
    "survey_id" VARCHAR(255) NOT NULL,
    "survey_title" VARCHAR(255),
    "survey_nickname" VARCHAR(255)
);

INSERT INTO "out_survey"
SELECT
    "id" AS "survey_id"
    , "title" AS "survey_title"
    , '' AS "survey_nickname" -- missing field in TypeForm dataset

FROM "form"
;

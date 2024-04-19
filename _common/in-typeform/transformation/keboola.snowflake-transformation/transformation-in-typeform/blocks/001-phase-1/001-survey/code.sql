-- creates a main list of surveys:
CREATE TABLE "out_survey"
(
    "survey_id" TEXT NOT NULL,
    "survey_title" TEXT,
    "survey_nickname" TEXT
);

INSERT INTO "out_survey"
SELECT
    "id" AS "survey_id"
    , "title" AS "survey_title"
    , '' AS "survey_nickname" -- missing field in TypeForm dataset

FROM "form"
;

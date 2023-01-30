--The reference for the question the answer relates to. Use the ref value to match answers with questions. The Responses payload only includes ref for the fields where you specified them when you created the form.

create table "pivot_prep" as
select 
    "field_id"
    , "responses_pk"
    , "choice_label"
    , "choice_other"
    , "choices_label"
    , "choices_other"
    , "date"
    , "email"
    , "file_url"
    , "number"
    , "boolean"
    , "text"
    , "url"
from "responses_answers"
;

create table "responses_pivoted" as
select * from "pivot_prep"
unpivot(response for type in (
      "choice_label"
    , "choice_other"
    , "choices_label"
    , "choices_other"
    , "date"
    , "email"
    , "file_url"
    , "number"
    , "boolean"
    , "text"
    , "url"))
;

delete from "responses_pivoted" where RESPONSE = '';

create table "out_responses" AS
select
    distinct ra."responses_pk"||'_'||ra."field_id" AS "response_id"
--    r."response_id"||'_'|| --Unique ID for the response. Note that response_id values are unique per form but are not unique globally.
--    ra."field_id" --The unique id of the form field the answer refers to
--    AS "response_id"
    , ra."responses_pk" AS "session_id"
    , ra."field_ref" AS "question_id"
--    , '' AS "survey_response_question_id"  
--    , ra."field_id"||'_'||IFNULL(ffpc."id",'') AS "answer_option_id"
    , oao."answer_option_id"
    , '' AS "ip_address"
    , '' AS "recipient_id"
    , TO_DATE(r."landed_at") AS "date_created"
    , '' AS "response_status"
    , rap."RESPONSE" AS "response_text"
    
    , rap."TYPE" AS "type_pivot"
    , ra."field_type"
--?
--    , srpqa."tag_data"
--    , AS "choice_value"
--    , TRY_TO_NUMBER(sdqac."text") as "choice_value_number"
--    , sdqar."text" AS "row_value"
--    , sdqaco."text" AS "col_value"
--    , sdqacoc."text" AS "col_choices_value"


from "responses_answers" ra
LEFT JOIN "responses" r ON r."response_id" = ra."responses_pk"
LEFT JOIN "responses_pivoted" rap ON ra."field_id" = rap."field_id" AND ra."responses_pk" = rap."responses_pk"
LEFT JOIN "out_answer_option" oao ON ra."field_id" = oao."question_id" AND rap."RESPONSE" = oao."choice_text"
;

-- referential integrity clean-up:
DELETE FROM "out_responses" WHERE "answer_option_id" NOT IN (SELECT "answer_option_id" FROM "out_answer_option");

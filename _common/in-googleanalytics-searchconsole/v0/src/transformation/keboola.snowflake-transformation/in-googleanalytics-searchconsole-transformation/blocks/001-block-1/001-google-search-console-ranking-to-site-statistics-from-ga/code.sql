CREATE TABLE "search_console_grouped_ranking"
(
    "page" VARCHAR(1024),
    "gsc_date" DATE,
    "gsc_average_ranking" FLOAT
);


-- group gsc results by url and date 
INSERT INTO "search_console_grouped_ranking" 
-- get average position from google search console
SELECT 
    "page"
    , TO_DATE(("date")::string,'YYYY-MM-DD') AS "gsc_date"
    , to_decimal(avg("position")) AS "gsc_average_ranking"
FROM "raw_search_console" 
GROUP BY "page", "date"
;

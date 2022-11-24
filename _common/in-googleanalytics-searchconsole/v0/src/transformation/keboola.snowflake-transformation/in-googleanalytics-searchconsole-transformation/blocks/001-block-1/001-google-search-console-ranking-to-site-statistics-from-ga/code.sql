-- group gsc results by url and date 
CREATE OR REPLACE TABLE "search_console_grouped_ranking" AS 
(
-- get average position from google search console
SELECT 
    "page"
    , TO_DATE(("date")::string,'YYYY-MM-DD') AS "gsc_date"
    , to_decimal(avg("position")) AS "gsc_average_ranking"
FROM "raw_search_console" 
GROUP BY "page", "date"
);

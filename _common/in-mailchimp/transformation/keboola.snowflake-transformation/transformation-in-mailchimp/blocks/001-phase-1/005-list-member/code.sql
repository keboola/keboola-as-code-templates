--create output pairing table for customers and lists
CREATE TABLE "list_member_out"
AS
SELECT "web_id"               AS "list_member_id",
       "id"                   AS "customer_id",
       "list_id",
       "status"               AS "list_member_status",
       "source"               AS "list_member_source",
       "unsubscribe_reason"   AS "list_member_unsubscribe_reason",
       "member_rating"        AS "list_member_rating",
       "stats_avg_open_rate"  AS "list_member_avg_open_rate",
       "stats_avg_click_rate" AS "list_member_avg_click_rate"
FROM "members";

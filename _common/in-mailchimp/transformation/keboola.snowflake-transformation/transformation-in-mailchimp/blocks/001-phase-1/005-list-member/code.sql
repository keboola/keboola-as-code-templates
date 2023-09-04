--create output pairing table for customers and lists
CREATE TABLE "list_member_out"
(
    "list_member_id" VARCHAR(255) NOT NULL,
    "customer_id" VARCHAR(255),
    "list_id" VARCHAR(255),
    "list_member_status" VARCHAR(255),
    "list_member_source" VARCHAR(255),
    "list_member_unsubscribe_reason" VARCHAR(255),
    "list_member_rating" INTEGER,
    "list_member_avg_open_rate" INTEGER,
    "list_member_avg_click_rate" INTEGER
);

INSERT INTO "list_member_out"
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

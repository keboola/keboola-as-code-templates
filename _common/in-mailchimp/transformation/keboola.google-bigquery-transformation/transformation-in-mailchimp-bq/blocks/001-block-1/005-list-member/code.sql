--create output pairing table for customers and lists
CREATE TABLE `list_member_out`
(
    list_member_id STRING NOT NULL,
    customer_id STRING,
    list_id STRING,
    list_member_status STRING,
    list_member_source STRING,
    list_member_unsubscribe_reason STRING,
    list_member_rating INT64,
    list_member_avg_open_rate INT64,
    list_member_avg_click_rate INT64
);

INSERT INTO `list_member_out`
SELECT web_id               				AS list_member_id,
       id                  					AS customer_id,
       list_id,
       status               				AS list_member_status,
       source               				AS list_member_source,
       unsubscribe_reason  					AS list_member_unsubscribe_reason,
       CAST(member_rating AS INT64)       	AS list_member_rating,
       CAST(stats_avg_open_rate AS INT64)  	AS list_member_avg_open_rate,
       CAST(stats_avg_click_rate AS iNT64)	AS list_member_avg_click_rate
FROM `members`;

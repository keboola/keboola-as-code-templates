--create output table with campaign events
--convert timestamp to datetime
CREATE TABLE "campaign_event_out" AS
SELECT "id" || '_sent'                                                      AS "campaign_event_id",
       "id"                                                                 AS "campaign_id",
       "recipients_list_id"                                                 AS "list_id",
       'sent'                                                               AS "campaign_event_type",
       iff("send_time" = '', '',
           TO_CHAR(TO_TIMESTAMP_NTZ("send_time"), 'YYYY-MM-DD hh24:mi:ss')) AS "campaign_event_date"
FROM "campaigns"
WHERE "send_time" != ''

UNION ALL

SELECT "id" || '_created'                                                     AS "campaign_event_id",
       "id"                                                                   AS "campaign_id",
       "recipients_list_id"                                                   AS "list_id",
       'created'                                                              AS "campaign_event_type",
       iff("create_time" = '', '',
           TO_CHAR(TO_TIMESTAMP_NTZ("create_time"), 'YYYY-MM-DD hh24:mi:ss')) AS "campaign_event_date"
FROM "campaigns"
WHERE "create_time" != '';

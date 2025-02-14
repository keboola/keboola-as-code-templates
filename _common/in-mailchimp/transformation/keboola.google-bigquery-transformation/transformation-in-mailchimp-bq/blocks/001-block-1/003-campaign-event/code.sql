--create output table with campaign events
--convert timestamp to datetime
CREATE TABLE `campaign_event_out`
(
    campaign_event_id STRING NOT NULL,
    campaign_id STRING,
    list_id STRING,
    campaign_event_type STRING,
    campaign_event_date DATETIME
);


INSERT INTO `campaign_event_out`
SELECT CONCAT(id, '_sent')                                                      AS campaign_event_id,
       id                                                                 			AS campaign_id,
       recipients_list_id                                                 			AS list_id,
       'sent'                                                               		AS campaign_event_type,  
 CAST( IF(send_time = '', '', FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%E3S', PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S%z', REGEXP_REPLACE(send_time, r'(\+\d{2}):(\d{2})$', r'\1\2')))) AS DATETIME) AS campaign_event_date   
       FROM `campaigns`
WHERE send_time != ''

UNION ALL

SELECT CONCAT(id ,'_created')                                                   AS campaign_event_id,
       id                                                                   		AS campaign_id,
       recipients_list_id                                                  			AS list_id,
       'created'                                                             		AS campaign_event_type,
       CAST(IF(create_time = '', '', FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%E3S', PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S%z', REGEXP_REPLACE(create_time, r'(\+\d{2}):(\d{2})$', r'\1\2')))) AS DATETIME) AS campaign_event_date
FROM `campaigns`
WHERE "create_time" != '';

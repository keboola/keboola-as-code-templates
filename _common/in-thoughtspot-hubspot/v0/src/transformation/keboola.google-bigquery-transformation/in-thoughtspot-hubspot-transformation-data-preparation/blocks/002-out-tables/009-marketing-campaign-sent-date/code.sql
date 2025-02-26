CREATE TABLE `MARKETING_CAMPAIGN_SENT_DATE` (
  `CAMPAIGN_ID` STRING(2000),
  `DATE_CAMPAIGN_SENT` DATETIME
);

INSERT INTO `MARKETING_CAMPAIGN_SENT_DATE`
SELECT
  `CAMPAIGN_ID`,
  MIN(`CREATED`) AS `DATE_CAMPAIGN_SENT`
FROM `MARKETING_EMAIL_TEMP` AS t
LEFT JOIN `MARKETING_EMAIL_EVENTS` AS ev
  ON t.`CAMPAIGN_ID` = ev.`EMAIL_CAMPAIGN_ID`
WHERE
  NOT `CREATED` IS NULL
GROUP BY
  `CAMPAIGN_ID`;
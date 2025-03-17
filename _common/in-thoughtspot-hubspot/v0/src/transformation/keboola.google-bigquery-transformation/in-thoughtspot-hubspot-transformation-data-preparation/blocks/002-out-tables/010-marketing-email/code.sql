CREATE TABLE `MARKETING_EMAIL` (
  `EMAIL_URL` STRING(2000),
  `DATE_CREATED` DATETIME,
  `EMAIL_FROM_NAME` STRING(255),
  `CAMPAIGN_NAME` STRING(255),
  `REPLY_TO_EMAIL` STRING(255),
  `BOUNCE` INT64,
  `CLICK` INT64,
  `CONTACTS_LOST` INT64,
  `DELIVERED` INT64,
  `OPEN` INT64,
  `REPLY` INT64,
  `SENT` INT64,
  `UNSUBSCRIBED` INT64,
  `BOUNCE_RATIO` FLOAT64,
  `CLICK_RATIO` FLOAT64,
  `CLICK_THROUGH_RATIO` FLOAT64,
  `OPEN_RATIO` FLOAT64,
  `EMAIL_SUBJECT` STRING(2000),
  `CAMPAIGN_ID` STRING(255),
  `DATE_CAMPAIGN_SENT` DATETIME,
  `CAMPAIGN_DATE` DATE,
  `CAMPAIGN_TIME` TIME
);

INSERT INTO `MARKETING_EMAIL`
SELECT
  t.*,
  s.`DATE_CAMPAIGN_SENT`,
  CAST(s.`DATE_CAMPAIGN_SENT` AS DATE) AS `CAMPAIGN_DATE`,
  TIME(s.`DATE_CAMPAIGN_SENT`) AS `CAMPAIGN_TIME`
FROM `MARKETING_EMAIL_TEMP` AS t
LEFT JOIN `MARKETING_CAMPAIGN_SENT_DATE` AS s
  ON t.`CAMPAIGN_ID` = s.`CAMPAIGN_ID`;
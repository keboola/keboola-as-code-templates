CREATE TABLE `MARKETING_EMAIL_EVENTS` (
  `APP_ID` STRING(2000),
  `APP_NAME` STRING(255),
  `CREATED` DATETIME,
  `EMAIL_CAMPAIGN_ID` STRING(2000),
  `ID` STRING(2000),
  `PORTAL_ID` STRING(2000),
  `RECIPIENT` STRING(255),
  `TYPE` STRING(255),
  `SENT_BY_CREATED` DATETIME,
  `SENT_BY_ID` STRING(2000),
  `BROWSER_NAME` STRING(255),
  `LOCATION_CITY` STRING(255),
  `LOCATION_COUNTRY` STRING(255),
  `LOCATION_STATE` STRING(255),
  `USER_AGENT` STRING(255),
  `DURATION` NUMERIC(38, 0),
  `SOURCE` STRING(255),
  `PORTAL_SUBSCRIPTION_STATUS` STRING(255),
  `ATTEMPT` STRING(255),
  `RESPONSE` STRING(255),
  `URL` STRING(2000),
  `SUBJECT` STRING(255),
  `FROM_EMAIL` STRING(255),
  `DROP_MESSAGE` STRING(255),
  `CAUSED_BY_ID` STRING(255),
  `PRE_CUSTOMER_MARKETING_EMAIL` NUMERIC(38, 0),
  `CREATED_AT_DATE` DATE,
  `CREATED_AT_TIME` TIME
)
INSERT INTO `MARKETING_EMAIL_EVENTS`
SELECT
  E.`APP_ID`,
  E.`APP_NAME`,
  CASE
    WHEN E.`CREATED` <> ''
    THEN DATE_ADD('1970-01-01', INTERVAL E.`CREATED` MILLISECOND)
    ELSE NULL
  END AS `CREATED`,
  E.`EMAIL_CAMPAIGN_ID`,
  E.`ID`,
  E.`PORTAL_ID`,
  E.`RECIPIENT`,
  E.`TYPE`,
  CASE
    WHEN E.`SENT_BY_CREATED` <> ''
    THEN DATE_ADD('1970-01-01', INTERVAL E.`SENT_BY_CREATED` MILLISECOND)
    ELSE NULL
  END AS `SENT_BY_CREATED`,
  E.`SENT_BY_ID`,
  E.`BROWSER_NAME`,
  E.`LOCATION_CITY`,
  E.`LOCATION_COUNTRY`,
  E.`LOCATION_STATE`,
  E.`USER_AGENT`,
  E.`DURATION`,
  E.`SOURCE`,
  E.`PORTAL_SUBSCRIPTION_STATUS`,
  E.`ATTEMPT`,
  E.`RESPONSE`,
  E.`URL`,
  E.`SUBJECT`,
  E.`FROM` AS `FROM_EMAIL`,
  E.`DROP_MESSAGE`,
  E.`CAUSED_BY_ID`,
  IF(
    NULLIF(CON.`TOTAL_REVENUE`, '') > 0
    AND E.TYPE = 'SENT'
    AND NULLIF(CON.`FIRST_DEAL_CREATED_DATE`, '') > (
      CASE
        WHEN E.`CREATED` <> ''
        THEN DATE_ADD('1970-01-01', INTERVAL E.`CREATED` MILLISECOND)
        ELSE NULL
      END
    ),
    1,
    0
  ) AS `PRE_CUSTOMER_MARKETING_EMAIL`,
  CASE
    WHEN E.`CREATED` <> ''
    THEN CAST(DATE_ADD('1970-01-01', INTERVAL E.`CREATED` MILLISECOND) AS DATE)
    ELSE NULL
  END AS `CREATED_AT_DATE`,
  CASE
    WHEN E.`CREATED` <> ''
    THEN TIME(DATE_ADD('1970-01-01', INTERVAL E.`CREATED` MILLISECOND))
    ELSE NULL
  END AS `CREATED_AT_TIME`
FROM `HS_EMAIL_EVENTS` AS E
LEFT JOIN `HS_CONTACTS` AS CON
  ON E.`RECIPIENT` = CON.`EMAIL`
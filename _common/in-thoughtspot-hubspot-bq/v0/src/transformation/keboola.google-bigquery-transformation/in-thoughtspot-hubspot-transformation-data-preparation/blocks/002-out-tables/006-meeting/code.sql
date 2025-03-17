CREATE TABLE `MEETING` (
  `START_TIME` DATETIME,
  `END_TIME` DATETIME,
  `TITLE` STRING(2000),
  `BODY` STRING(2000),
  `MEETING_OUTCOME` STRING(255),
  `LOCATION` STRING(2000),
  `CREATED_AT` DATETIME,
  `CREATED_BY` STRING(255),
  `ID` STRING(2000),
  `CONTACT_ID` STRING(2000),
  `PRE_CUSTOMER_MEET` NUMERIC(38, 0),
  `MEETING_DATE` DATE,
  `MEETING_TIME` TIME
)
INSERT INTO `MEETING`
SELECT
  CASE
    WHEN M.`START_TIME` <> ''
    THEN DATE_ADD('1970-01-01', INTERVAL M.`START_TIME` MILLISECOND)
    ELSE NULL
  END AS `START_TIME`,
  CASE
    WHEN M.`END_TIME` <> ''
    THEN DATE_ADD('1970-01-01', INTERVAL M.`END_TIME` MILLISECOND)
    ELSE NULL
  END AS `END_TIME`,
  M.`TITLE`,
  M.`BODY`,
  M.`MEETING_OUTCOME`,
  M.`LOCATION`,
  CASE
    WHEN E.`CREATED_AT` <> ''
    THEN DATE_ADD('1970-01-01', INTERVAL E.`CREATED_AT` MILLISECOND)
    ELSE NULL
  END AS `CREATED_AT`,
  E.`CREATED_BY`,
  E.`ID`,
  CE.`CONTACT_ID`,
  IF(
    NULLIF(CON.`TOTAL_REVENUE`, '') > 0
    AND CON.`FIRST_DEAL_CREATED_DATE` > (
      CASE
        WHEN E.`CREATED_AT` <> ''
        THEN DATE_ADD('1970-01-01', INTERVAL E.`CREATED_AT` MILLISECOND)
        ELSE NULL
      END
    ),
    1,
    0
  ) AS `PRE_CUSTOMER_MEET`,
  CASE
    WHEN M.`START_TIME` <> ''
    THEN CAST(DATE_ADD('1970-01-01', INTERVAL M.`START_TIME` MILLISECOND) AS DATE)
    ELSE NULL
  END AS `MEETING_DATE`,
  CASE
    WHEN M.`START_TIME` <> ''
    THEN TIME(DATE_ADD('1970-01-01', INTERVAL M.`START_TIME` MILLISECOND))
    ELSE NULL
  END AS `MEETING_TIME`
FROM `HS_ENGAGEMENT_MEETING` AS M
LEFT JOIN `HS_ENGAGEMENTS` AS E
  ON M.`ENGAGEMENT_ID` = E.`ID`
LEFT JOIN `HS_CONTACT_ENGAGEMENT_ASSOCIATION` AS CE
  ON CE.`ENGAGEMENT_ID` = E.`ID`
LEFT JOIN `HS_CONTACTS` AS CON
  ON CON.`ID` = CE.`CONTACT_ID`;
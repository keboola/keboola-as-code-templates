CREATE TABLE `CALL` (
  `BODY` STRING(2000),
  `TITLE` STRING(2000),
  `CREATED_AT` DATETIME,
  `CREATED_BY` STRING(255),
  `UID` STRING(255),
  `CONTACT_ID` STRING(2000),
  `CALL_OUTCOME` STRING(255),
  `PRE_CUSTOMER_CALL` NUMERIC(38, 0),
  `CREATED_AT_DATE` DATE,
  `CREATED_AT_TIME` TIME
);

INSERT INTO `CALL`
SELECT
  C.`BODY`,
  C.`TITLE`,
  DATE_ADD('1970-01-01', INTERVAL E.`CREATED_AT` MILLISECOND) AS `CREATED_AT`,
  E.`CREATED_BY`,
  E.`ID` AS `UID`,
  CE.`CONTACT_ID`,
  D.`LABEL` AS `CALL_OUTCOME`,
  IF(
    CON.`TOTAL_REVENUE` > 0
    AND CON.`FIRST_DEAL_CREATED_DATE` > DATE_ADD('1970-01-01', INTERVAL E.`CREATED_AT` MILLISECOND),
    1,
    0
  ) AS `PRE_CUSTOMER_CALL`,
  CAST(DATE_ADD('1970-01-01', INTERVAL E.`CREATED_AT` MILLISECOND) AS DATE) AS `CREATED_AT_DATE`,
  TIME(DATE_ADD('1970-01-01', INTERVAL E.`CREATED_AT` MILLISECOND)) AS `CREATED_AT_TIME`
FROM `HS_ENGAGEMENT_CALL` AS C
LEFT JOIN `HS_ENGAGEMENTS` AS E
  ON C.`ENGAGEMENT_ID` = E.`ID`
LEFT JOIN `HS_CONTACT_ENGAGEMENT_ASSOCIATION` AS CE
  ON CE.`ENGAGEMENT_ID` = E.`ID`
LEFT JOIN `HS_CALL_DISPOSITIONS` AS D
  ON C.`DISPOSITION` = D.`ID`
LEFT JOIN `HS_CONTACTS` AS CON
  ON CON.`ID` = CE.`CONTACT_ID`;
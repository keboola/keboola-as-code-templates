CREATE TABLE `FORMS` (
  `GUID` STRING(2000),
  `NAME` STRING(2000),
  `ACTION` STRING(2000),
  `SUBMIT_TEXT` STRING(2000),
  `LEAD_NURTURING_CAMPAIGN_ID` STRING(2000)
)
INSERT INTO `FORMS`
SELECT
  `GUID`,
  `NAME` AS `FORM_NAME`,
  `ACTION`,
  `SUBMIT_TEXT`,
  `LEAD_NURTURING_CAMPAIGN_ID`
FROM `HS_FORMS`;
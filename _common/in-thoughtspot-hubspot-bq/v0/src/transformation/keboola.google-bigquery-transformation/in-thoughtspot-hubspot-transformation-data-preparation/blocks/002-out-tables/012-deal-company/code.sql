CREATE TABLE `DEAL_COMPANY` (
  `DEAL_ID` STRING(2000),
  `COMPANY_ID` STRING(2000)
)
INSERT INTO `DEAL_COMPANY`
SELECT
  `DEAL_ID`,
  `COMPANY_ID`
FROM `HS_DEAL_COMPANY_ASSOCIATION`;
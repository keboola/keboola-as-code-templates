/* NOT collected session_id and client_id */
CREATE TABLE `out_ga4_traffic` (
  `ga_traffic_id` STRING(1024) NOT NULL,
  `sessions_new` INT64,
  `sessions_return` INT64,
  `pageviews` INT64,
  `bounces` INT64
)
INSERT INTO `out_ga4_traffic`
SELECT
  COALESCE(`date`, '') || '*' || COALESCE(`source`, '') || '*' || COALESCE(`medium`, '') || '*' || COALESCE(`campaign`, '') || '*' || COALESCE(`domain`, '') || '*' || COALESCE(`account_id`, '') || '*' || COALESCE(`keyword`, '') || '*' || COALESCE(`ad_group`, '') AS `ga_traffic_id`,
  SUM(`sessions_new`) AS `sessions_new`,
  SUM(`sessions_return`) AS `sessions_return`,
  SUM(`pageviews`) AS `pageviews`,
  SUM(`bounces`) AS `bounces`
FROM (
  SELECT
    `date`,
    LOWER(IF(`sessionSource` = '(not set)', '', `sessionSource`)) AS `source`,
    LOWER(IF(`sessionMedium` = '(not set)', '', `sessionMedium`)) AS `medium`,
    LOWER(IF(`sessionCampaignName` = '(not set)', '', `sessionCampaignName`)) AS `campaign`,
    LOWER(SUBSTRING(`hostName`, LENGTH(`hostName`) - INSTR(reverse(`hostName`), '.') + 2)) AS `domain`,
    LOWER(`idProperty`) AS `account_id`,
    LOWER(`sessionGoogleAdsKeyword`) AS `keyword`,
    LOWER(`sessionGoogleAdsAdGroupName`) AS `ad_group`,
    CASE WHEN `newVsReturning` = 'new' THEN CAST(`sessions` AS FLOAT64) ELSE 0 END AS `sessions_new`,
    CASE WHEN `newVsReturning` = 'returning' THEN CAST(`sessions` AS FLOAT64) ELSE 0 END AS `sessions_return`,
    `screenPageViews` AS `pageviews`,
    CAST(`sessions` AS FLOAT64) - CAST(`engagedSessions` AS FLOAT64) AS `bounces`
  FROM `ga4_basic_sessions`
)
WHERE
  (
    `sessions_new` + `sessions_return` + `pageviews` + `bounces`
  ) > 0
GROUP BY
  `date`,
  `source`,
  `medium`,
  `campaign`,
  `domain`,
  `account_id`,
  `keyword`,
  `ad_group`
/* transaction detail */
CREATE TABLE `out_ga4_transactions` (
  `ga_transactions_id` STRING(1024) NOT NULL,
  `item_quantity` INT64
)
INSERT INTO `out_ga4_transactions`
SELECT
  COALESCE(`date`, '') || '*' || COALESCE(`source`, '') || '*' || COALESCE(`medium`, '') || '*' || COALESCE(`campaign`, '') || '*' || COALESCE(`domain`, '') || '*' || COALESCE(`account_id`, '') || '*' || COALESCE(`keyword`, '') || '*' || COALESCE(`ad_group`, '') || '*' || COALESCE(`transaction_id`, '') AS `ga_transactions_id`,
  SUM(`item_quantity`) AS `item_quantity`
FROM (
  SELECT
    `date`,
    LOWER(IF(`sessionSource` = '(not set)', '', `sessionSource`)) AS `source`,
    LOWER(IF(`sessionMedium` = '(not set)', '', `sessionMedium`)) AS `medium`,
    LOWER(IF(`sessionCampaignName` = '(not set)', '', `sessionCampaignName`)) AS `campaign`,
    LOWER(SUBSTRING(`hostName`, LENGTH(`hostName`) - INSTR(reverse(`hostName`), '.') + 2)) AS `domain`,
    LOWER(`idProperty`) AS `account_id`,
    LOWER(`sessionGoogleAdsKeyword`) AS `keyword`,
    LOWER(`sessionGoogleAdsAdGroupName`) AS `ad_group`,
    LOWER(`transactionId`) AS `transaction_id`,
    `itemsPurchased` AS `item_quantity`
  FROM `ga4_basic_transactions`
)
WHERE
  `item_quantity` > 0
GROUP BY
  `date`,
  `source`,
  `medium`,
  `campaign`,
  `domain`,
  `account_id`,
  `keyword`,
  `ad_group`,
  `transaction_id`
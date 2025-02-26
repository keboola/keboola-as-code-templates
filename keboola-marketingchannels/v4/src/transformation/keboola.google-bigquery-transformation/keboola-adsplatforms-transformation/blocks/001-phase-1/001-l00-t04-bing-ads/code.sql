CREATE OR REPLACE VIEW `tmp_bing_new` AS
SELECT
  a.`TimePeriod` AS `date`,
  'BingAds' AS `source`,
  LOWER(b.`Bid_Strategy_Type`) AS `medium`,
  LOWER(a.`CampaignName`) AS `campaign`,
  SPLIT_PART(b.`Domain`, '.', -1) AS `domain`,
  LOWER(a.`CurrencyCode`) AS `currency`,
  LOWER(a.`AccountId`) AS `account_id`,
  a.`Impressions` AS `impressions`,
  a.`Clicks` AS `clicks`,
  a.`Spend` AS `costs`
FROM `Bing_Ads_campaignperformance` AS a
INNER JOIN `Bing_Ads_campaigns` AS b
  ON a.`CampaignId` = b.`Id`
/* output table grouping */
CREATE TABLE `out_bingads` (
  `bing_id` STRING(1024) NOT NULL,
  `impressions` INT64,
  `clicks` INT64,
  `costs` FLOAT64
)
INSERT INTO `out_bingads`
SELECT
  COALESCE(`date`, '') || '*' || COALESCE(`source`, '') || '*' || COALESCE(`medium`, '') || '*' || COALESCE(`campaign`, '') || '*' || COALESCE(`domain`, '') || '*' || COALESCE(`currency`, '') || '*' || COALESCE(`account_id`, '') AS `bing_id`,
  SUM(`impressions`) AS `impressions`,
  SUM(`clicks`) AS `clicks`,
  SUM(`costs`) AS `costs`
FROM `tmp_bing_new`
GROUP BY
  `date`,
  `source`,
  `medium`,
  `campaign`,
  `domain`,
  `currency`,
  `account_id`
CREATE OR REPLACE VIEW `tmp_linkedin` AS
SELECT
  a.`start_date` AS `date`,
  'linkedinads' AS `source`,
  LOWER(b.`costType`) AS `medium`,
  LOWER(b.`name`) AS `campaign`,
  '' AS `domain`,
  LOWER(b.`unitCost_currencyCode`) AS `currency`,
  b.`account` AS `account_id`,
  a.`impressions` AS `impressions`,
  a.`clicks` AS `clicks`,
  c.`costInLocalCurrency` AS `costs`
FROM `linkedin_ads_basic_stats` AS a
LEFT JOIN `linkedin_campaigns` AS b
  ON a.`campaign_id` = b.`campaign_id`
LEFT JOIN `linkedin_ads_cost` AS c
  ON a.`pk` = c.`pk`
WHERE
  a.`pivot` = 'CAMPAIGN' AND c.`pivot` = 'CAMPAIGN';

/* output table grouping */
CREATE TABLE `out_linkedin` (
  `linkedin_id` STRING(1024) NOT NULL,
  `impressions` INT64,
  `clicks` INT64,
  `costs` FLOAT64
);

INSERT INTO `out_linkedin`
SELECT
  COALESCE(`date`, '') || '*' || COALESCE(`source`, '') || '*' || COALESCE(`medium`, '') || '*' || COALESCE(`campaign`, '') || '*' || COALESCE(`domain`, '') || '*' || COALESCE(`currency`, '') || '*' || COALESCE(`account_id`, '') AS `linkedin_id`,
  SUM(`impressions`) AS `impressions`,
  SUM(`clicks`) AS `clicks`,
  SUM(`costs`) AS `costs`
FROM `tmp_linkedin`
GROUP BY
  `date`,
  `source`,
  `medium`,
  `campaign`,
  `domain`,
  `currency`,
  `account_id`;
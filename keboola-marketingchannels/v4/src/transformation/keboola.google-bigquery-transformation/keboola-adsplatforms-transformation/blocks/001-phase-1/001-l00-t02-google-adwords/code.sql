/* join all source tables in one */ /* create UTM tags (see also query and function above) */ /* costs have to be adjusted (divided by 1mil units) */
CREATE VIEW `tmp_adwords` AS
SELECT
  a.`segmentsDate` AS `date`,
  'google' AS `source`,
  'cpc' AS `medium`,
  LOWER(c.`name`) AS `campaign`,
  LOWER(
    SPLIT_PART(
      CAST(JSON_EXTRACT(parse_url(`landingPageViewUnexpandedFinalUrl`, 1), '$.host') AS STRING),
      '.',
      -1
    )
  ) AS `domain`,
  LOWER(b.`currencyCode`) AS `currency`,
  LOWER(b.`id`) AS `account_id`,
  a.`metricsImpressions` AS `impressions`,
  a.`metricsClicks` AS `clicks`,
  ROUND(CAST(a.`metricsCostMicros` AS FLOAT64) / 1000000, 3) AS `costs`
FROM `Google_Adwords_ad_groups` AS a
LEFT JOIN `Google_Adwords_campaigns` AS c
  ON a.`campaignId` = c.`id`
LEFT JOIN `Google_Adwords_customers` AS b
  ON c.`customerId` = b.`id`
LEFT JOIN `Google_Adwords_url_adwords` AS `d`
  ON a.`campaignId` = `d`.`campaignId`
  AND a.`adGroupId` = `d`.`adGroupId`
  AND a.`segmentsDate` = `d`.`segmentsDate`;

/* output table grouping */
CREATE TABLE `out_adwords` (
  `adwords_id` STRING(1024) NOT NULL,
  `impressions` INT64,
  `clicks` INT64,
  `costs` FLOAT64
);

INSERT INTO `out_adwords`
SELECT
  COALESCE(`date`, '') || '*' || COALESCE(`source`, '') || '*' || COALESCE(`medium`, '') || '*' || COALESCE(`campaign`, '') || '*' || COALESCE(`domain`, '') || '*' || COALESCE(`currency`, '') || '*' || COALESCE(`account_id`, '') AS `adwords_id`,
  SUM(`impressions`) AS `impressions`,
  SUM(`clicks`) AS `clicks`,
  SUM(`costs`) AS `costs`
FROM `tmp_adwords`
GROUP BY
  `date`,
  `source`,
  `medium`,
  `campaign`,
  `domain`,
  `currency`,
  `account_id`;
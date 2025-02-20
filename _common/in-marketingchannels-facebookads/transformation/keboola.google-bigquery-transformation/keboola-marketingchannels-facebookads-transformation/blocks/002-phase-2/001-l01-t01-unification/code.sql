/* table with account id Labels */
CREATE OR REPLACE TABLE `accounts` (
  `ads_system` STRING NOT NULL,
  `account_id` STRING NOT NULL,
  `account_name` STRING NOT NULL
)
INSERT INTO `accounts` (
  `ads_system`,
  `account_id`,
  `account_name`
)
SELECT
  'facebook' AS `ads_system`,
  `account_id`,
  `name`
FROM `Facebook_Ads_accounts`
/* collect all ads system in one table */
CREATE OR REPLACE VIEW `tmp_ads_systems` AS
SELECT
  COALESCE(`account_name`, '') || '*' || COALESCE(`date`, '') || '*' || COALESCE(`source`, '') || '*' || COALESCE(`medium`, '') || '*' || COALESCE(`campaign`, '') || '*' || COALESCE(`domain`, '') AS `id`,
  SUM(`clicks`) AS `clicks`,
  SUM(`impressions`) AS `impressions`,
  SUM(CAST(`costs_cpc` AS FLOAT64)) AS `costs_cpc`,
  SUM(CAST(`costs_conversion` AS FLOAT64)) AS `costs_conversion`
FROM (
  SELECT
    COALESCE(t2.`account_name`, 'Others') AS `account_name`,
    SPLIT_PART(`id`, '*', 1) AS `date`,
    SPLIT_PART(`id`, '*', 2) AS `source`,
    SPLIT_PART(`id`, '*', 3) AS `medium`,
    SPLIT_PART(`id`, '*', 4) AS `campaign`,
    SPLIT_PART(`id`, '*', 5) AS `domain`,
    `impressions`,
    `clicks`,
    `costs_cpc`,
    `costs_conversion`
  FROM (
    SELECT
      `facebook_ads_id` AS `id`,
      `impressions`,
      `clicks`,
      `costs` AS `costs_cpc`,
      0 AS `costs_conversion`
    FROM `out_facebook`
  ) AS t1
  LEFT JOIN `accounts` AS t2
    ON SPLIT_PART(t1.`id`, '*', 7) = `account_id`
) AS t
WHERE
  `costs_cpc` > 0 OR `costs_conversion` > 0
GROUP BY
  `account_name`,
  `date`,
  `source`,
  `medium`,
  `campaign`,
  `domain`
/* final facebook marketing table */
CREATE TABLE `out_marketing` (
  `online_marketing_traffic_id` STRING(1024) NOT NULL,
  `account_name` STRING(255),
  `date` DATE,
  `source` STRING(255),
  `medium` STRING(255),
  `campaign` STRING(255),
  `domain` STRING(255),
  `impressions` INT64,
  `clicks` INT64,
  `costs_cpc` FLOAT64,
  `costs_conversion` FLOAT64
)
INSERT INTO `out_marketing`
SELECT
  `id` AS `online_marketing_traffic_id`,
  SPLIT_PART(`id`, '*', 1) AS `account_name`,
  SPLIT_PART(`id`, '*', 2) AS `date`,
  SPLIT_PART(`id`, '*', 3) AS `source`,
  SPLIT_PART(`id`, '*', 4) AS `medium`,
  SPLIT_PART(`id`, '*', 5) AS `campaign`,
  SPLIT_PART(`id`, '*', 6) AS `domain`,
  `impressions`,
  `clicks`,
  `costs_cpc`,
  `costs_conversion`
FROM (
  SELECT
    `id`,
    SUM(`impressions`) AS `impressions`,
    SUM(`clicks`) AS `clicks`,
    SUM(`costs_cpc`) AS `costs_cpc`,
    SUM(`costs_conversion`) AS `costs_conversion`
  FROM `tmp_ads_systems`
  WHERE
    NOT `id` IS NULL
  GROUP BY
    `id`
) AS t
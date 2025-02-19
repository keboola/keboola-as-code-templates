/* prepare data from ga */
CREATE VIEW `tmp_ga4_pre` AS
SELECT
  COALESCE(t2.`account_name`, 'Others') AS `account_name`,
  SPLIT_PART(`ga_traffic_id`, '*', 1) AS `date`,
  SPLIT_PART(`ga_traffic_id`, '*', 2) AS `source`,
  SPLIT_PART(`ga_traffic_id`, '*', 3) AS `medium`,
  SPLIT_PART(`ga_traffic_id`, '*', 4) AS `campaign`,
  SPLIT_PART(`ga_traffic_id`, '*', 5) AS `domain`,
  SPLIT_PART(`ga_traffic_id`, '*', 7) AS `keyword`,
  SPLIT_PART(`ga_traffic_id`, '*', 8) AS `ad_group`,
  `sessions_new`,
  `sessions_return`,
  `pageviews`,
  `bounces`
FROM `out_ga4_traffic` AS t1
LEFT JOIN `accounts` AS t2
  ON SPLIT_PART(t1.`ga_traffic_id`, '*', 6) = `account_id`
/* table with relationships between ("keyword" ,"ad_group") and ga traffic data */
CREATE TABLE `out_keyword_ad_group` (
  `keyword_id` STRING(1024) NOT NULL,
  `online_marketing_traffic_id` STRING(1024),
  `keyword` STRING(255),
  `ad_group` STRING(255)
)
INSERT INTO `out_keyword_ad_group`
SELECT DISTINCT
  COALESCE(`account_name`, '') || '*' || COALESCE(`date`, '') || '*' || COALESCE(`source`, '') || '*' || COALESCE(`medium`, '') || '*' || COALESCE(`campaign`, '') || '*' || COALESCE(`domain`, '') || '*' || COALESCE(`keyword`, '') || '*' || COALESCE(`ad_group`, '') AS `keyword_id`,
  COALESCE(`account_name`, '') || '*' || COALESCE(`date`, '') || '*' || COALESCE(`source`, '') || '*' || COALESCE(`medium`, '') || '*' || COALESCE(`campaign`, '') || '*' || COALESCE(`domain`, '') AS `online_marketing_traffic_id`,
  `keyword`,
  `ad_group`
FROM `tmp_ga4_pre`
/* sum ga metrics */
CREATE OR REPLACE VIEW `tmp_ga4` AS
SELECT
  COALESCE(`account_name`, '') || '*' || COALESCE(`date`, '') || '*' || COALESCE(`source`, '') || '*' || COALESCE(`medium`, '') || '*' || COALESCE(`campaign`, '') || '*' || COALESCE(`domain`, '') AS `id`,
  SUM(`sessions_new`) AS `sessions_new`,
  SUM(`sessions_return`) AS `sessions_return`,
  SUM(`pageviews`) AS `pageviews`,
  SUM(`bounces`) AS `bounces`
FROM `tmp_ga4_pre`
GROUP BY
  `account_name`,
  `date`,
  `source`,
  `medium`,
  `campaign`,
  `domain`
/* merge ga information and costs */
CREATE TABLE `tmp_marketing` AS
SELECT
  COALESCE(t1.`online_marketing_traffic_id`, t2.`id`) AS `id`,
  COALESCE(t1.`impressions`, 0) AS `impressions`,
  COALESCE(t1.`clicks`, 0) AS `clicks`,
  COALESCE(t1.`costs_cpc`, 0) AS `costs_cpc`,
  COALESCE(t1.`costs_conversion`, 0) AS `costs_conversion`,
  COALESCE(t2.`sessions_new`, 0) AS `sessions_new`,
  COALESCE(t2.`sessions_return`, 0) AS `sessions_return`,
  COALESCE(t2.`pageviews`, 0) AS `pageviews`,
  COALESCE(t2.`bounces`, 0) AS `bounces`
FROM `online_marketing` AS t1
FULL OUTER JOIN `tmp_ga4` AS t2
  ON t1.`online_marketing_traffic_id` = t2.`id`
/* final traffic table */
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
  `costs_conversion` FLOAT64,
  `sessions_new` INT64,
  `sessions_return` INT64,
  `pageviews` INT64,
  `bounces` INT64
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
  `costs_conversion`,
  `sessions_new`,
  `sessions_return`,
  `pageviews`,
  `bounces`
FROM (
  SELECT
    `id`,
    SUM(`impressions`) AS `impressions`,
    SUM(`clicks`) AS `clicks`,
    SUM(`costs_cpc`) AS `costs_cpc`,
    SUM(`costs_conversion`) AS `costs_conversion`,
    SUM(`sessions_new`) AS `sessions_new`,
    SUM(`sessions_return`) AS `sessions_return`,
    SUM(`pageviews`) AS `pageviews`,
    SUM(`bounces`) AS `bounces`
  FROM `tmp_marketing`
  WHERE
    NOT `id` IS NULL
  GROUP BY
    `id`
)
/* final transaction table */
CREATE TABLE `out_marketing_transactions` (
  `online_marketing_transactions_id` STRING(1024) NOT NULL,
  `online_marketing_traffic_id` STRING(1024),
  `account_name` STRING(255),
  `date` DATE,
  `source` STRING(255),
  `medium` STRING(255),
  `campaign` STRING(255),
  `domain` STRING(255),
  `transaction_id` STRING(255),
  `item_quantity` INT64
)
INSERT INTO `out_marketing_transactions`
SELECT
  COALESCE(`account_name`, '') || '*' || COALESCE(`date`, '') || '*' || COALESCE(`source`, '') || '*' || COALESCE(`medium`, '') || '*' || COALESCE(`campaign`, '') || '*' || COALESCE(`domain`, '') || '*' || COALESCE(`transaction_id`, '') AS `online_marketing_transactions_id`,
  COALESCE(`account_name`, '') || '*' || COALESCE(`date`, '') || '*' || COALESCE(`source`, '') || '*' || COALESCE(`medium`, '') || '*' || COALESCE(`campaign`, '') || '*' || COALESCE(`domain`, '') AS `online_marketing_traffic_id`,
  `account_name`,
  `date`,
  `source`,
  `medium`,
  `campaign`,
  `domain`,
  `transaction_id`,
  SUM(`item_quantity`) AS `item_quantity`
FROM (
  SELECT
    `ga_transactions_id`,
    `account_name`,
    SPLIT_PART(`ga_transactions_id`, '*', 1) AS `date`,
    SPLIT_PART(`ga_transactions_id`, '*', 2) AS `source`,
    SPLIT_PART(`ga_transactions_id`, '*', 3) AS `medium`,
    SPLIT_PART(`ga_transactions_id`, '*', 4) AS `campaign`,
    SPLIT_PART(`ga_transactions_id`, '*', 5) AS `domain`,
    SPLIT_PART(`ga_transactions_id`, '*', 9) AS `transaction_id`,
    `item_quantity`
  FROM `out_ga4_transactions` AS t1
  LEFT JOIN `accounts` AS t2
    ON SPLIT_PART(t1.`ga_transactions_id`, '*', 6) = `account_id`
)
GROUP BY
  `account_name`,
  `date`,
  `source`,
  `medium`,
  `campaign`,
  `domain`,
  `transaction_id`
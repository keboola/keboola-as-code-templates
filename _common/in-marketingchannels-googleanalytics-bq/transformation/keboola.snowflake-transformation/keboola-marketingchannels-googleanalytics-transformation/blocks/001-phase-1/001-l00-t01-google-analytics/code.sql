/* NOT collected session_id and client_id */
CREATE TABLE `out_ga_traffic` (
  `ga_traffic_id` STRING(1024) NOT NULL,
  `sessions_new` INT64,
  `sessions_return` INT64,
  `pageviews` INT64,
  `bounces` INT64
)
INSERT INTO `out_ga_traffic`
SELECT
  COALESCE(`date`, '') || '*' || COALESCE(`source`, '') || '*' || COALESCE(`medium`, '') || '*' || COALESCE(`campaign`, '') || '*' || COALESCE(`domain`, '') || '*' || COALESCE(`account_id`, '') || '*' || COALESCE(`keyword`, '') || '*' || COALESCE(`ad_group`, '') AS `ga_traffic_id`,
  SUM(`sessions_new`) AS `sessions_new`,
  SUM(`sessions_return`) AS `sessions_return`,
  SUM(`pageviews`) AS `pageviews`,
  SUM(`bounces`) AS `bounces`
FROM (
  SELECT
    `date`,
    LOWER(IF(`source` = '(not set)', '', `source`)) AS `source`,
    LOWER(IF(`medium` = '(not set)', '', `medium`)) AS `medium`,
    LOWER(IF(`campaign` = '(not set)', '', `campaign`)) AS `campaign`,
    LOWER(SUBSTRING(`hostname`, LENGTH(`hostname`) - INSTR(reverse(`hostname`), '.') + 2)) AS `domain`,
    LOWER(`idProfile`) AS `account_id`,
    LOWER(`keyword`) AS `keyword`,
    LOWER(`adGroup`) AS `ad_group`,
    CASE WHEN `userType` = 'New Visitor' THEN CAST(`sessions` AS FLOAT64) ELSE 0 END AS `sessions_new`,
    CASE
      WHEN `userType` = 'Returning Visitor'
      THEN CAST(`sessions` AS FLOAT64)
      ELSE 0
    END AS `sessions_return`,
    `pageviews`,
    `bounces`
  FROM `ga-basic-sessions`
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
CREATE TABLE `out_ga_transactions` (
  `ga_transactions_id` STRING(1024) NOT NULL,
  `item_quantity` INT64
)
INSERT INTO `out_ga_transactions`
SELECT
  COALESCE(`date`, '') || '*' || COALESCE(`source`, '') || '*' || COALESCE(`medium`, '') || '*' || COALESCE(`campaign`, '') || '*' || COALESCE(`domain`, '') || '*' || COALESCE(`account_id`, '') || '*' || COALESCE(`keyword`, '') || '*' || COALESCE(`ad_group`, '') || '*' || COALESCE(`transaction_id`, '') AS `ga_transactions_id`,
  SUM(`item_quantity`) AS `item_quantity`
FROM (
  SELECT
    `date`,
    LOWER(IF(`source` = '(not set)', '', `source`)) AS `source`,
    LOWER(IF(`medium` = '(not set)', '', `medium`)) AS `medium`,
    LOWER(IF(`campaign` = '(not set)', '', `campaign`)) AS `campaign`,
    LOWER(SUBSTRING(`hostname`, LENGTH(`hostname`) - INSTR(reverse(`hostname`), '.') + 2)) AS `domain`,
    LOWER(`idProfile`) AS `account_id`,
    LOWER(`keyword`) AS `keyword`,
    LOWER(`adGroup`) AS `ad_group`,
    LOWER(`transactionId`) AS `transaction_id`,
    `itemQuantity` AS `item_quantity`
  FROM `ga-basic-transactions`
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
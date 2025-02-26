/* sklik campaigns source data */
CREATE TABLE `bdm_marketing_campaign_costs` (
  `MARKETING_CAMPAIGN_COSTS_ID` STRING NOT NULL,
  `SOURCE` STRING,
  `DATE` DATE,
  `CAMPAIGN` STRING,
  `IMPRESSIONS` INT64,
  `CLICKS` INT64,
  `COST` FLOAT64
);

INSERT INTO `bdm_marketing_campaign_costs`
SELECT
  LEFT(`st`.`date`, 4) || '-' || RIGHT(LEFT(`st`.`date`, 6), 2) || '-' || RIGHT(LEFT(`st`.`date`, 8), 2) || '-' || 'Sklik' || '-' || `c`.`name` AS `MARKETING_CAMPAIGN_COSTS_ID`,
  'Sklik' AS `SOURCE`,
  LEFT(`st`.`date`, 4) || '-' || RIGHT(LEFT(`st`.`date`, 6), 2) || '-' || RIGHT(LEFT(`st`.`date`, 8), 2) AS `DATE`,
  `c`.`name` AS `CAMPAIGN`,
  SUM(`st`.`impressions`) AS `IMPRESSIONS`,
  SUM(`st`.`clicks`) AS `CLICKS`,
  SUM(`st`.`totalMoney`) / 100 AS `COST`
FROM `sklik-campaigns-stats` AS `st`
LEFT JOIN `sklik-campaigns` AS `c`
  ON `st`.`id` = `c`.`id`
WHERE
  `st`.`date` <> ''
GROUP BY
  1,
  2,
  3,
  4;

/* sklik campaigns source data grouped by month */
CREATE TABLE `bdm_marketing_campaign_costs_monthly` (
  `MARKETING_CAMPAIGN_COSTS_ID` STRING NOT NULL,
  `SOURCE` STRING,
  `DATE` DATE,
  `CAMPAIGN` STRING,
  `IMPRESSIONS` INT64,
  `CLICKS` INT64,
  `COST` FLOAT64
);

INSERT INTO `bdm_marketing_campaign_costs_monthly`
SELECT
  LEFT(`st`.`date`, 4) || '-' || RIGHT(LEFT(`st`.`date`, 6), 2) || '-01' || '-' || 'Sklik' || '-' || `c`.`name` AS `MARKETING_CAMPAIGN_COSTS_ID`,
  'Sklik' AS `SOURCE`,
  LEFT(`st`.`date`, 4) || '-' || RIGHT(LEFT(`st`.`date`, 6), 2) || '-01' AS `DATE`,
  `c`.`name` AS `CAMPAIGN`,
  SUM(`st`.`impressions`) AS `IMPRESSIONS`,
  SUM(`st`.`clicks`) AS `CLICKS`,
  SUM(`st`.`totalMoney`) / 100 AS `COST`
FROM `sklik-campaigns-monthly-stats` AS `st`
LEFT JOIN `sklik-campaigns-monthly` AS `c`
  ON `st`.`id` = `c`.`id`
WHERE
  `st`.`date` <> ''
GROUP BY
  1,
  2,
  3,
  4;
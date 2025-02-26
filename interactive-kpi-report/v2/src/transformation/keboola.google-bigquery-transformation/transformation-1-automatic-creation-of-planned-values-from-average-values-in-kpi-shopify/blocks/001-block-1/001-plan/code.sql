/* sales */
CREATE TABLE `sales_monthly` AS
SELECT
  EXTRACT(year FROM CAST(`updated_at` AS DATE)) AS `year`,
  EXTRACT(month FROM CAST(`updated_at` AS DATE)) AS `month`,
  'Turnover' AS `metric_name`,
  SUM(`current_total_price_set__shop_money__amount`) AS `plan_value`
FROM `order`
GROUP BY
  1,
  2;

/* orders */
CREATE TABLE `orders_monthly` AS
SELECT
  EXTRACT(year FROM CAST(`updated_at` AS DATE)) AS `year`,
  EXTRACT(month FROM CAST(`updated_at` AS DATE)) AS `month`,
  'Orders' AS `metric_name`,
  COUNT(*) AS `plan_value`
FROM `order`
GROUP BY
  1,
  2;

/* new customers */
CREATE TABLE `new_customers_monthly` AS
SELECT
  EXTRACT(year FROM CAST(`updated_at` AS DATE)) AS `year`,
  EXTRACT(month FROM CAST(`updated_at` AS DATE)) AS `month`,
  'New Customers' AS `metric_name`,
  COUNT(*) AS `plan_value`
FROM `customer`
WHERE
  `last_order_id` = ''
GROUP BY
  1,
  2;

/* AOV */
CREATE TABLE `AOV_monthly` AS
SELECT
  EXTRACT(year FROM CAST(`updated_at` AS DATE)) AS `year`,
  EXTRACT(month FROM CAST(`updated_at` AS DATE)) AS `month`,
  'Average Order Value' AS `metric_name`,
  AVG(
    CASE
      WHEN `current_total_price_set__shop_money__amount` > 0
      THEN `current_total_price_set__shop_money__amount`
      ELSE NULL
    END
  ) AS `plan_value`
FROM `order`
GROUP BY
  1,
  2;

/* total customers */
CREATE TABLE `total_customers_monthly` AS
SELECT
  EXTRACT(year FROM CAST(`updated_at` AS DATE)) AS `year`,
  EXTRACT(month FROM CAST(`updated_at` AS DATE)) AS `month`,
  'Total Customers' AS `metric_name`,
  COUNT(*) AS `plan_value`
FROM `customer`
GROUP BY
  1,
  2;

/* final table "plan_monthly" */
CREATE TABLE `out_plan_monthly` AS
SELECT
  `year`,
  `month`,
  `metric_name`,
  `plan_value`
FROM `sales_monthly`
UNION ALL
SELECT
  `year`,
  `month`,
  `metric_name`,
  `plan_value`
FROM `orders_monthly`
UNION ALL
SELECT
  `year`,
  `month`,
  `metric_name`,
  `plan_value`
FROM `new_customers_monthly`
UNION ALL
SELECT
  `year`,
  `month`,
  `metric_name`,
  `plan_value`
FROM `AOV_monthly`
UNION ALL
SELECT
  `year`,
  `month`,
  `metric_name`,
  `plan_value`
FROM `total_customers_monthly`;

/* dummy table creation to have bucket for data app */
CREATE TABLE `test` AS
SELECT
  1 AS `value`;
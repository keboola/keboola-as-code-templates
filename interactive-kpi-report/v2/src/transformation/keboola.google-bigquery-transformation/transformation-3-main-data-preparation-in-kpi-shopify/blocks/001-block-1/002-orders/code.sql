CREATE TABLE `orders` AS
WITH orders AS (
  SELECT
  	DATE(TIMESTAMP(`updated_at`))AS `date`,
    'Orders' AS `kpi_name`,
    COUNT(*) AS `actual_value`,
    'number' AS `type`
  FROM `order`
  GROUP BY
    DATE(TIMESTAMP(`updated_at`))
)
SELECT
  o.`date`,
  o.`kpi_name`,
  o.`actual_value`,
  p.`plan_value`,
  o.`type`
FROM orders AS o
LEFT JOIN `plan_daily` AS p
    ON o.`kpi_name` = p.`metric_name` AND o.`date` = CAST(p.`date` AS DATE);
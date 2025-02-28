CREATE TABLE `new_customers` AS
WITH new_customers AS (
  SELECT
 		DATE(TIMESTAMP(`updated_at`)) AS `date`,
    'New Customers' AS `kpi_name`,
    COUNT(*) AS `actual_value`,
    'number' AS `type`
  FROM `customer`
  WHERE
    `last_order_id` = ''
  GROUP BY
    DATE(TIMESTAMP(`updated_at`))
)
SELECT
  nc.`date`,
  nc.`kpi_name`,
  nc.`actual_value`,
  p.`plan_value`,
  nc.`type`
FROM new_customers AS nc
LEFT JOIN `plan_daily` AS p
  ON nc.`kpi_name` = p.`metric_name` AND nc.`date` = CAST(p.`date` AS DATE);
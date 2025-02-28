CREATE TABLE `total_customers` AS
WITH total_customers AS (
  SELECT
    DATE(TIMESTAMP(`updated_at`)) AS `date`,
    'Total Customers' AS `kpi_name`,
    COUNT(*) AS `actual_value`,
    'number' AS `type`
  FROM `customer`
  GROUP BY
    DATE(TIMESTAMP(`updated_at`))
)
SELECT
  tc.`date`,
  tc.`kpi_name`,
  tc.`actual_value`,
  p.`plan_value`,
  tc.`type`
FROM total_customers AS tc
LEFT JOIN `plan_daily` AS p
  ON tc.`kpi_name` = p.`metric_name` AND tc.`date` = CAST(p.`date` AS DATE);
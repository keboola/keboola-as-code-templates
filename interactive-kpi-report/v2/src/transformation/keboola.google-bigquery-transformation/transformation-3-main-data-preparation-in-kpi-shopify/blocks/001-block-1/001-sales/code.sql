CREATE TABLE `sales` AS
WITH sales AS (
  SELECT
     DATE(TIMESTAMP(`created_at`)) AS date,
    'Turnover' AS `kpi_name`,
    SUM(CAST(`current_total_price_set__shop_money__amount` AS FLOAT64)) AS `actual_value`,
    'number' AS `type`
  FROM `order`
  WHERE
    `financial_status` = 'paid'
  GROUP BY
      DATE(TIMESTAMP(`created_at`))
)
SELECT
  s.`date`,
  s.`kpi_name`,
  s.`actual_value`,
  p.`plan_value`,
  s.`type`
FROM sales AS s
LEFT JOIN `plan_daily` AS p
  ON s.`kpi_name` = p.`metric_name` AND s.`date` = CAST(p.`date` AS DATE);
  

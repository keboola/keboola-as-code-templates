CREATE TABLE `sales` AS
WITH sales AS (
  SELECT
    CAST(`updated_at` AS DATE) AS `date`,
    'Turnover' AS `kpi_name`,
    SUM(`current_total_price_set__shop_money__amount`) AS `actual_value`,
    'number' AS `type`
  FROM `order`
  WHERE
    `financial_status` = 'paid'
  GROUP BY
    CAST(`updated_at` AS DATE)
)
SELECT
  s.`date`,
  s.`kpi_name`,
  s.`actual_value`,
  p.`plan_value`,
  s.`type`
FROM sales AS s
LEFT JOIN `plan_daily` AS p
  ON s.`kpi_name` = p.`metric_name` AND s.`date` = p.`date`
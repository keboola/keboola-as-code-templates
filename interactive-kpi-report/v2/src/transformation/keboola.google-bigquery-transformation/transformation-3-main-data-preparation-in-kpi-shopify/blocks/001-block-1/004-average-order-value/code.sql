CREATE TABLE `average_order` AS
WITH AOV AS (
  SELECT
    DATE(TIMESTAMP(`updated_at`)) AS `date`,
    'Average Order Value' AS `kpi_name`,
    AVG(CAST(`current_total_price_set__shop_money__amount` AS FLOAT64)) AS `actual_value`,
    'number' AS `type`
  FROM `order`
  WHERE
    `financial_status` = 'paid'
  GROUP BY
    DATE(TIMESTAMP(`updated_at`))
)
SELECT
  a.`date`,
  a.`kpi_name`,
  a.`actual_value`,
  p.`plan_value`,
  a.`type`
FROM AOV AS a
LEFT JOIN `plan_daily` AS p
  ON a.`kpi_name` = p.`metric_name` AND a.`date` = CAST(p.`date` AS DATE);
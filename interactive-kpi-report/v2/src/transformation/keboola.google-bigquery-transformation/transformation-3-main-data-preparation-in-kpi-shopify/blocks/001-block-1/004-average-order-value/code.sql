CREATE TABLE `average_order` AS
WITH AOV AS (
  SELECT
    CAST(`updated_at` AS DATE) AS `date`,
    'Average Order Value' AS `kpi_name`,
    AVG(`current_total_price_set__shop_money__amount`) AS `actual_value`,
    'number' AS `type`
  FROM `order`
  WHERE
    `financial_status` = 'paid'
  GROUP BY
    CAST(`updated_at` AS DATE)
)
SELECT
  a.`date`,
  a.`kpi_name`,
  a.`actual_value`,
  p.`plan_value`,
  a.`type`
FROM AOV AS a
LEFT JOIN `plan_daily` AS p
  ON a.`kpi_name` = p.`metric_name` AND a.`date` = p.`date`;
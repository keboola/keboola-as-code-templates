CREATE TABLE `out_shopify_metrics` AS
SELECT
  `date`,
  `kpi_name`,
  `actual_value`,
  `plan_value`,
  `type`
FROM `sales`
UNION ALL
SELECT
  `date`,
  `kpi_name`,
  `actual_value`,
  `plan_value`,
  `type`
FROM `orders`
UNION ALL
SELECT
  `date`,
  `kpi_name`,
  `actual_value`,
  `plan_value`,
  `type`
FROM `new_customers`
UNION ALL
SELECT
  `date`,
  `kpi_name`,
  `actual_value`,
  `plan_value`,
  `type`
FROM `average_order`
UNION ALL
SELECT
  `date`,
  `kpi_name`,
  `actual_value`,
  `plan_value`,
  `type`
FROM `total_customers`;
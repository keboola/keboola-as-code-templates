CREATE TABLE "sales" AS
WITH sales AS
(
  SELECT 
  "updated_at"::date AS "date"
  ,'sales' AS "kpi_name"
  ,sum("current_total_price_set__shop_money__amount") AS "actual_value"
  ,'number' AS "type"
  FROM "order"
  WHERE "financial_status"='paid'
  GROUP BY "updated_at"::date
)
SELECT
  s."date"
  ,s."kpi_name"
  ,s."actual_value"
  ,p."plan_value"
  ,s."type"
FROM sales s
LEFT JOIN "plan_daily" p ON s."kpi_name" = p."metric_name" AND s."date" = p."date";

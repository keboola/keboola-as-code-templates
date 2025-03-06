CREATE TABLE "new_customers" AS 
WITH new_customers AS
(
  SELECT 
  "updated_at"::date AS "date"
  ,'New Customers' AS "kpi_name"
  ,count(*) AS "actual_value"
  ,'number' AS "type"
  FROM "customer" 
  WHERE "last_order_id"=''
  GROUP BY "updated_at"::date
)
SELECT 
  nc."date"
  ,nc."kpi_name"
  ,nc."actual_value"
  ,p."plan_value"
  ,nc."type"
FROM new_customers nc
LEFT JOIN "plan_daily" p ON nc."kpi_name" = p."metric_name" AND nc."date" = p."date"
;

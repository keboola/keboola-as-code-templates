CREATE TABLE "total_customers" AS 
WITH total_customers AS
(
  SELECT 
  "updated_at"::date AS "date"
  ,'Total Customers' AS "kpi_name"
  ,count(*) AS "actual_value"
  ,'number' AS "type"
  FROM "customer" 
  GROUP BY "updated_at"::date
)
SELECT
  tc."date"
  ,tc."kpi_name"
  ,tc."actual_value"
  ,p."plan_value"
  ,tc."type"
FROM total_customers tc
LEFT JOIN "plan_daily" p ON tc."kpi_name" = p."metric_name" AND tc."date" = p."date"
;

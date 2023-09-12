CREATE TABLE "orders" AS
WITH orders AS
(
  SELECT
  "updated_at"::date AS "date"
  ,'orders' AS "kpi_name"
  ,count(*) AS "actual_value"
  ,'number' AS "type"
  FROM "order" 
  --where "financial_status"='paid'
  GROUP BY "updated_at"::date
)
SELECT 
o."date"
,o."kpi_name"
,o."actual_value"
,p."plan_value"
,o."type"
FROM orders o
LEFT JOIN "plan_daily" p ON o."kpi_name" = p."metric_name" AND o."date" = p."date"
;

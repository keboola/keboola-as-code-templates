--sales
CREATE TABLE "sales_monthly" AS
SELECT 
	DATE_PART(year,"updated_at"::DATE) as "year", 
    DATE_PART(month,"updated_at"::DATE) as "month",
	'Turnover' as "metric_name",
	SUM("current_total_price_set__shop_money__amount") as "plan_value" 
FROM "order" 
--WHERE "financial_status"='paid'
GROUP BY 1,2;

--orders
CREATE TABLE "orders_monthly" AS
SELECT
	DATE_PART(year,"updated_at"::DATE) as "year", 
	DATE_PART(month,"updated_at"::DATE) as "month", 
	'Orders' as "metric_name",
	count(*) as "plan_value"
FROM "order"
--WHERE "financial_status"='paid'
GROUP BY 1,2;

--new customers
CREATE TABLE "new_customers_monthly" AS
SELECT
	DATE_PART(year,"updated_at"::DATE) as "year", 
	DATE_PART(month,"updated_at"::DATE) as "month",
	'New Customers' AS "metric_name",
	count(*) AS "plan_value"
FROM "customer"
WHERE "last_order_id"=''
GROUP BY 1,2;

--AOV
CREATE TABLE "AOV_monthly" AS
SELECT
	DATE_PART(year,"updated_at"::DATE) as "year", 
	DATE_PART(month,"updated_at"::DATE) as "month",
	'Average Order Value' as "metric_name",
	AVG(CASE WHEN "current_total_price_set__shop_money__amount" > 0 THEN "current_total_price_set__shop_money__amount" ELSE NULL END) as "plan_value"
FROM "order"
--WHERE "financial_status"='paid'
GROUP BY 1,2;

--total customers
CREATE TABLE "total_customers_monthly" AS
SELECT
DATE_PART(year,"updated_at"::DATE) as "year", 
DATE_PART(month,"updated_at"::DATE) as "month",
'Total Customers' as "metric_name",
count(*) as "plan_value"
FROM "customer"
GROUP BY 1,2;

--final table "plan_monthly"
CREATE TABLE "out_plan_monthly" AS
SELECT
"year",
"month",
"metric_name",
"plan_value"
FROM "sales_monthly"
UNION ALL
SELECT 
"year",
"month",
"metric_name",
"plan_value"
FROM "orders_monthly"
UNION ALL
SELECT 
"year",
"month",
"metric_name",
"plan_value"
FROM "new_customers_monthly"
UNION ALL
SELECT 
"year",
"month",
"metric_name",
"plan_value"
FROM "AOV_monthly"
UNION ALL
SELECT 
"year",
"month",
"metric_name",
"plan_value"
FROM "total_customers_monthly";


-- dummy table creation to have bucket for data app
Create table "test" as SELECT 1 as "value";
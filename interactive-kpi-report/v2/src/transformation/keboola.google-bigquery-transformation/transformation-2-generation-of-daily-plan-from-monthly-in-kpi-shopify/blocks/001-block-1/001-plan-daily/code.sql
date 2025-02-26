CREATE TABLE date_series AS 
SELECT 
    '2018-12-31'::date + row_number() over(order by 0) date,
    DATE_PART(year,date) as year,
    DATE_PART(month,date) as month
FROM TABLE(generator(rowcount => 366 * (year(current_date)-2017)));

CREATE TABLE "out_plan_daily" AS
WITH days AS
(
  SELECT 
    count(distinct ds.date) as "days",
    ds.year, 
    ds.month
  FROM date_series ds
  FULL OUTER JOIN "plan_monthly" p ON ds.year = p."year" AND ds.month = p."month"
  WHERE "metric_name" is not null
  GROUP BY ds.year, ds.month
),
plan_value_monthly AS
(
  SELECT
    "year", 
    "month", 
    ROUND("plan_value" / "days",2) as "plan_value", 
    "metric_name"
  FROM "plan_monthly" p
  INNER JOIN days d ON d.year = p."year" AND d.month = p."month"
)
SELECT 
  ds.date as "date", 
  "plan_value", 
  "metric_name"
FROM date_series ds 
FULL OUTER JOIN plan_value_monthly p ON ds.year = p."year" AND ds.month = p."month"
WHERE "metric_name" is not null;

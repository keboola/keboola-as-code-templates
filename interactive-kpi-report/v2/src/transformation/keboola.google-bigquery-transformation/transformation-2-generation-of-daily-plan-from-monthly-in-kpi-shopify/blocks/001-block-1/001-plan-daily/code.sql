CREATE TABLE date_series AS
SELECT
  date AS date,
  EXTRACT(year FROM date) AS year,
  EXTRACT(month FROM date) AS month
FROM
  UNNEST(GENERATE_DATE_ARRAY('2018-12-31', DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY))) AS date;

CREATE TABLE `out_plan_daily` AS
WITH days AS (
  SELECT
    COUNT(DISTINCT ds.date) AS `days`,
    ds.year,
    ds.month
  FROM date_series AS ds
  FULL OUTER JOIN `plan_monthly` AS p
  	ON CAST(ds.year AS STRING) = CAST(p.year AS STRING) AND CAST(ds.month AS STRING) = CAST(p.month AS STRING)
  WHERE
    NOT `metric_name` IS NULL
  GROUP BY
    ds.year,
    ds.month
), plan_value_monthly AS (
  SELECT
    d.`year`,
    d.`month`,
  	ROUND(CAST(plan_value AS FLOAT64) / days, 2) AS plan_value,
    `metric_name`
  FROM `plan_monthly` AS p
  INNER JOIN days AS d
		ON CAST(d.year AS STRING) = CAST(p.year AS STRING) AND CAST(d.month AS STRING) = CAST(p.month AS STRING)
)
SELECT
  ds.date AS `date`,
  `plan_value`,
  `metric_name`
FROM date_series AS ds
FULL OUTER JOIN plan_value_monthly AS p
	ON CAST(ds.year AS STRING) = CAST(p.year AS STRING) AND CAST(ds.month AS STRING) = CAST(p.month AS STRING)
WHERE
  NOT `metric_name` IS NULL;
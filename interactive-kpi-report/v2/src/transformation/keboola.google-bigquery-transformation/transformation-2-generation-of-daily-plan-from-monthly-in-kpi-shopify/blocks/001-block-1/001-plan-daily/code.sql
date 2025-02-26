CREATE TABLE date_series AS
SELECT
  CAST('2018-12-31' AS DATE) + ROW_NUMBER() OVER (ORDER BY 0 NULLS LAST) AS date,
  EXTRACT(year FROM date) AS year,
  EXTRACT(month FROM date) AS month
FROM TABLE(generator(rowcount => 366 * (
  YEAR(CURRENT_DATE) - 2017
)));

CREATE TABLE `out_plan_daily` AS
WITH days AS (
  SELECT
    COUNT(DISTINCT ds.date) AS `days`,
    ds.year,
    ds.month
  FROM date_series AS ds
  FULL OUTER JOIN `plan_monthly` AS p
    ON ds.year = p.`year` AND ds.month = p.`month`
  WHERE
    NOT `metric_name` IS NULL
  GROUP BY
    ds.year,
    ds.month
), plan_value_monthly AS (
  SELECT
    `year`,
    `month`,
    ROUND(`plan_value` / `days`, 2) AS `plan_value`,
    `metric_name`
  FROM `plan_monthly` AS p
  INNER JOIN days AS d
    ON d.year = p.`year` AND d.month = p.`month`
)
SELECT
  ds.date AS `date`,
  `plan_value`,
  `metric_name`
FROM date_series AS ds
FULL OUTER JOIN plan_value_monthly AS p
  ON ds.year = p.`year` AND ds.month = p.`month`
WHERE
  NOT `metric_name` IS NULL;
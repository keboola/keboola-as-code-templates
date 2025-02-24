{
  processors: {},
  parameters: {
    query: "WITH ranked_accesses AS (\n  SELECT *,\n         ROW_NUMBER() OVER(PARTITION BY USER_NAME,DATABASE_NAME ORDER BY CAST(START_TIME AS TIMESTAMP)) AS row_number,\n         TO_DATE(CAST(START_TIME AS TIMESTAMP)) AS access_date\n  FROM snowflake.account_usage.query_history\n),\nfirst_time_accesses AS (\n  SELECT access_date, USER_NAME,DATABASE_NAME \n  from ranked_accesses\n  WHERE row_number = 1\n),\ndaily_new_resource_count AS (\n  SELECT access_date, USER_NAME, COUNT(DISTINCT DATABASE_NAME) AS count, ARRAY_AGG(DISTINCT DATABASE_NAME) AS database_names\n  FROM first_time_accesses\n  GROUP BY access_date, USER_NAME \n),\nstats AS (\n  SELECT AVG(count) AS avg_count, STDDEV_POP(count) AS stddev_count\n  FROM daily_new_resource_count\n),\noutlier_detection AS (\n  SELECT *,\n         (SELECT avg_count FROM stats) + 3 * (SELECT stddev_count FROM stats) AS upper_bound,\n         (SELECT avg_count FROM stats) - 3 * (SELECT stddev_count FROM stats) AS lower_bound\n  FROM daily_new_resource_count\n)\nSELECT *\nFROM outlier_detection\nWHERE count > upper_bound OR count < lower_bound",
    outputTable: "in.c-keboola-ex-db-snowflake-" + ConfigId("snowflake-security-data-source") + ".anomaly_detection_daily_new_resource",
    incremental: false,
    primaryKey: [],
  },
}

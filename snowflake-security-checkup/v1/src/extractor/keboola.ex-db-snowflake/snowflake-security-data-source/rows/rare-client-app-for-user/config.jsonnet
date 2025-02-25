{
  processors: {},
  parameters: {
    query: "WITH sessions_enriched AS (\nSELECT *, \n        TO_DATE(CREATED_ON) AS unique_date,\n        PARSE_JSON(client_environment) :APPLICATION :: STRING AS client_application,\nFROM\n    snowflake.account_usage.sessions\nWHERE client_application is not null \n),\n\napp_total_count AS (\n  SELECT USER_NAME,client_application, COUNT(*) AS app_total_count\n  FROM sessions_enriched\n  GROUP BY USER_NAME,client_application\n),\n\ntotal_usage AS (\n  SELECT USER_NAME, COUNT(*) AS total_usage\n  FROM sessions_enriched\n  GROUP BY USER_NAME\n),\n\nfinal_counts AS (\n  SELECT c.USER_NAME, c.client_application ,c.app_total_count, t.total_usage,\n         (c.app_total_count / t.total_usage) * 100 AS app_usage_pct\n  FROM app_total_count c\n  JOIN total_usage t ON c.USER_NAME = t.USER_NAME\n),\n\nanomaly AS (\n  SELECT *\n  FROM final_counts\n  WHERE app_usage_pct < 5\n),\n\nanomaly_apps AS (\n  SELECT q.USER_NAME, q.client_application,ARRAY_AGG(DISTINCT q.unique_date) AS anomalous_dates, AVG(a.app_usage_pct) AS avg_usage_pct\n  FROM sessions_enriched q\n  JOIN anomaly a ON q.USER_NAME = a.USER_NAME AND q.client_application = a.client_application \n  GROUP BY q.USER_NAME, q.client_application\n)\n\nSELECT *\nFROM anomaly_apps",
    outputTable: "in.c-keboola-ex-db-snowflake-" + ConfigId("snowflake-security-data-source") + ".rare_client_app_for_user",
    incremental: false,
    primaryKey: [],
  },
}

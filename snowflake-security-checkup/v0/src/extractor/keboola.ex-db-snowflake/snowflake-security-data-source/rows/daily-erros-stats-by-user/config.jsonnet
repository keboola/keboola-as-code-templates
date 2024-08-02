{
  processors: {},
  parameters: {
    query: "WITH error_stats AS (\n    SELECT \n        TO_DATE(START_TIME) AS date,\n        USER_NAME, \n        COUNT(*) AS error_count\n    FROM snowflake.account_usage.query_history\n    WHERE error_code IS NOT NULL\n    GROUP BY date, USER_NAME\n),\n\ntotal_queries AS (\n    SELECT \n        TO_DATE(START_TIME) AS date,\n        USER_NAME, \n        COUNT(*) AS total_queries\n    FROM snowflake.account_usage.query_history\n    GROUP BY date, USER_NAME\n),\n\nfinal_stats AS (\n    SELECT \n        tq.date, \n        tq.USER_NAME, \n        tq.total_queries, \n        COALESCE(es.error_count, 0) AS error_count,\n        (COALESCE(es.error_count, 0) / tq.total_queries) * 100 AS daily_error_percentage\n    FROM total_queries tq\n    LEFT JOIN error_stats es \n        ON tq.date = es.date \n        AND tq.USER_NAME = es.USER_NAME\n)\n\nSELECT * \nFROM final_stats\nORDER BY date, USER_NAME;",
    outputTable: "in.c-keboola-ex-db-snowflake-" + ConfigId("snowflake-security-data-source") + ".daily_erros_stats_by_user",
    incremental: false,
    primaryKey: [],
  },
}

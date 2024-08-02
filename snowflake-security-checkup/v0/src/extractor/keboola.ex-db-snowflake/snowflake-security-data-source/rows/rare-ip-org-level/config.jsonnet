{
  processors: {},
  parameters: {
    query: "WITH ip_percentage AS (\n    SELECT \n        CLIENT_IP, \n        (COUNT(*) / SUM(COUNT(*)) OVER () * 100) AS usage_percentage\n    FROM snowflake.account_usage.login_history\n    GROUP BY CLIENT_IP\n)\nSELECT\n    lh.CLIENT_IP, \n    ARRAY_AGG(DISTINCT DATE(lh.EVENT_TIMESTAMP)) AS dates_used,\n    ARRAY_AGG(DISTINCT lh.USER_NAME) AS users, \n    ip_percentage.usage_percentage\nFROM ip_percentage\nJOIN table(information_schema.login_history()) lh ON ip_percentage.CLIENT_IP = lh.CLIENT_IP\nWHERE ip_percentage.usage_percentage < 5\nGROUP BY lh.CLIENT_IP, ip_percentage.usage_percentage;",
    outputTable: "in.c-keboola-ex-db-snowflake-" + ConfigId("snowflake-security-data-source") + ".rare_ip_org_level",
    incremental: false,
    primaryKey: [],
  },
}

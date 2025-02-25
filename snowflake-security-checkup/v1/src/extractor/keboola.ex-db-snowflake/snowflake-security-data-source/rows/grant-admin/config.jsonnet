{
  processors: {},
  parameters: {
    query: "SELECT *\nFROM snowflake.account_usage.query_history\nWHERE QUERY_TYPE = 'GRANT'\nAND (\n    QUERY_TEXT ILIKE '%grant%role%accountadmin%to%'\n    OR QUERY_TEXT ILIKE '%grant%role%securityadmin%to%'\n    OR QUERY_TEXT ILIKE '%grant%role%sysadmin%to%');",
    outputTable: "in.c-keboola-ex-db-snowflake-" + ConfigId("snowflake-security-data-source") + ".grant_admin",
    incremental: false,
    primaryKey: [],
  },
}

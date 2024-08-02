{
  processors: {},
  parameters: {
    query: "SELECT\n    *\nFROM\n    snowflake.account_usage.sessions\nWHERE\n    PARSE_JSON(CLIENT_ENVIRONMENT):APPLICATION = 'rapeflake'\n    OR\n    (\n        PARSE_JSON(CLIENT_ENVIRONMENT):APPLICATION = 'DBeaver_DBeaverUltimate'\n        AND\n        PARSE_JSON(CLIENT_ENVIRONMENT):OS = 'Windows Server 2022'\n    )\nORDER BY CREATED_ON;",
    outputTable: "in.c-keboola-ex-db-snowflake-" + ConfigId("snowflake-security-data-source") + ".attack_tools",
    incremental: false,
    primaryKey: [],
  },
}

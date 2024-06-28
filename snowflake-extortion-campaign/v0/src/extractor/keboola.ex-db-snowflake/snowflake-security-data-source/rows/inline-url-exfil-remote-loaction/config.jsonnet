{
  processors: {},
  parameters: {
    query: "WITH copy_into AS (\n  SELECT\n    *,\n    LOWER(QUERY_TEXT) AS query_text_lower,\n  FROM\n    snowflake.account_usage.query_history\n  WHERE\n    LOWER(QUERY_TEXT) LIKE '%copy into%'\n    and QUERY_TYPE = 'UNLOAD'\n),\nfinal AS (\n  SELECT\n    *,\n    REGEXP_SUBSTR (\n      query_text_lower,\n      '(s3://[^\\\\s]+|gcs://[^\\\\s]+|azure://[^\\\\s]+)', 1) AS extracted_url\n  FROM\n    copy_into\n  WHERE\n    extracted_url IS NOT NULL\n)\nSELECT\n  *\nFROM\n  final;",
    outputTable: "in.c-keboola-ex-db-snowflake-" + ConfigId("snowflake-security-data-source") + ".inline_url_exfil_remote_loaction",
    incremental: false,
    primaryKey: [],
  },
}

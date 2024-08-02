{
  processors: {},
  parameters: {
    query: "WITH FailedAttempts AS (\n  SELECT\n    USER_NAME,\n    date,\n    EVENT_TIMESTAMP,\n    CASE WHEN IS_SUCCESS = false THEN 1 ELSE 0 END AS FAILED_ATTEMPT,\n    -- Identify a successful attempt following failed attempts\n    CASE WHEN IS_SUCCESS = true AND LAG(IS_SUCCESS) OVER (PARTITION BY USER_NAME, date ORDER BY EVENT_TIMESTAMP) = false THEN 1 ELSE 0 END AS SUCCESS_FOLLOWING_FAILURE\n  FROM login_history\n),\nCumulativeFailed AS (\n  SELECT\n    *,\n    SUM(FAILED_ATTEMPT) OVER (PARTITION BY USER_NAME, date ORDER BY EVENT_TIMESTAMP) - SUM(SUCCESS_FOLLOWING_FAILURE) OVER (PARTITION BY USER_NAME, date ORDER BY EVENT_TIMESTAMP) AS CUMULATIVE_FAILED\n  FROM FailedAttempts\n),\nTotalAttempts AS (\n  SELECT\n    *,\n    COUNT(*) OVER (PARTITION BY USER_NAME, date ORDER BY EVENT_TIMESTAMP) AS TOTAL_ATTEMPTS,\n    SUM(FAILED_ATTEMPT) OVER (PARTITION BY USER_NAME, date ORDER BY EVENT_TIMESTAMP) - LAG(CUMULATIVE_FAILED, 1, 0) OVER (PARTITION BY USER_NAME, date ORDER BY EVENT_TIMESTAMP) AS TOTAL_SUBSEQUENT_FAILS\n  FROM CumulativeFailed\n)\n\nSELECT *\nFROM TotalAttempts\nWHERE TOTAL_SUBSEQUENT_FAILS >= 5\nAND SUCCESS_FOLLOWING_FAILURE = 1 \nORDER BY USER_NAME, date, EVENT_TIMESTAMP;",
    outputTable: "in.c-keboola-ex-db-snowflake-" + ConfigId("snowflake-security-data-source") + ".login_brute_force",
    incremental: false,
    primaryKey: [],
  },
}

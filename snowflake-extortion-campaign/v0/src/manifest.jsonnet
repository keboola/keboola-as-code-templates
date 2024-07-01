{ mainConfig: {
    componentId: "keboola.ex-db-snowflake",
    id: ConfigId("snowflake-security-data-source"),
  },
  configurations: [
    {
      componentId: "keboola.ex-db-snowflake",
      id: ConfigId("snowflake-security-data-source"),
      path: "extractor/keboola.ex-db-snowflake/snowflake-security-data-source",
      rows: [
        {
          id: ConfigRowId("anomaly-detection-daily-new-resource"),
          path: "rows/anomaly-detection-daily-new-resource",
        },
        {
          id: ConfigRowId("attack-tools"),
          path: "rows/attack-tools",
        },
        {
          id: ConfigRowId("daily-erros-stats-by-user"),
          path: "rows/daily-erros-stats-by-user",
        },
        {
          id: ConfigRowId("grant-admin"),
          path: "rows/grant-admin",
        },
        {
          id: ConfigRowId("inline-url-exfil-remote-loaction"),
          path: "rows/inline-url-exfil-remote-loaction",
        },
        {
          id: ConfigRowId("login-brute-force"),
          path: "rows/login-brute-force",
        },
        {
          id: ConfigRowId("rare-client-app-for-user"),
          path: "rows/rare-client-app-for-user",
        },
        {
          id: ConfigRowId("rare-ip-org-level"),
          path: "rows/rare-ip-org-level",
        },
        {
          id: ConfigRowId("user-timeline"),
          path: "rows/user-timeline",
        },
      ],
    },
  ],
}

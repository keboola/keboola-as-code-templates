{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-git-github"),
  },
  configurations: std.filter(function(v) v != null,[
     {
      componentId: "keboola.orchestrator",
      id: ConfigId("flow-git-github"),
      path: "other/keboola.orchestrator/flow-git-github",
      rows: [],
    },
    {
      componentId: "keboola.ex-github",
      id: ConfigId("data-source-in-git-github"),
      path: "<common>/in-git-github/extractor/keboola.ex-github/data-source-in-git-github",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation1-organization-user-in-git-github"),
      path: "<common>/in-git-github/transformation/keboola.snowflake-transformation/transformation1-organization-user-in-git-github",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[GIT-GITHUB]"}
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation2-output-tables-creation-in-git-github"),
      path: "<common>/in-git-github/transformation/keboola.snowflake-transformation/transformation2-output-tables-creation-in-git-github",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[GIT-GITHUB]"}
    },
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-git-bigquery"),
      path: "<common>/out-git-bigquery/writer/keboola.wr-google-bigquery-v2/data-destination-out-git-bigquery",
      rows: [
        {
          id: ConfigRowId("event"),
          path: "rows/event",
        },
        {
          id: ConfigRowId("issue"),
          path: "rows/issue",
        },
        {
          id: ConfigRowId("issue-comment"),
          path: "rows/issue-comment",
        },
        {
          id: ConfigRowId("organization"),
          path: "rows/organization",
        },
        {
          id: ConfigRowId("organization-user"),
          path: "rows/organization-user",
        },
        {
          id: ConfigRowId("pull-request"),
          path: "rows/pull-request",
        },
        {
          id: ConfigRowId("pull-request-activity"),
          path: "rows/pull-request-activity",
        },
        {
          id: ConfigRowId("repository"),
          path: "rows/repository",
        },
        {
          id: ConfigRowId("repository-commit"),
          path: "rows/repository-commit",
        },
        {
          id: ConfigRowId("user"),
          path: "rows/user",
        },
      ],
    },
    if InputIsAvailable("google-sheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("data-destination-out-git-gsheet"),
      path: "<common>/out-git-gsheet/writer/keboola.wr-google-sheets/data-destination-out-git-gsheet",
      rows: [],
    },
    if InputIsAvailable("wr-snowflake-blob-storage-db-host") then
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("data-destination-out-git-snowflake"),
      path: "<common>/out-git-snowflake/writer/keboola.wr-snowflake-blob-storage/data-destination-out-git-snowflake",
      rows: [
        {
          id: ConfigRowId("event-001"),
          path: "rows/event-001",
        },
        {
          id: ConfigRowId("issue-001"),
          path: "rows/issue-001",
        },
        {
          id: ConfigRowId("issue-comment-001"),
          path: "rows/issue-comment-001",
        },
        {
          id: ConfigRowId("organization-001"),
          path: "rows/organization-001",
        },
        {
          id: ConfigRowId("organization-user-001"),
          path: "rows/organization-user-001",
        },
        {
          id: ConfigRowId("pull-request-001"),
          path: "rows/pull-request-001",
        },
        {
          id: ConfigRowId("pull-request-activity-001"),
          path: "rows/pull-request-activity-001",
        },
        {
          id: ConfigRowId("repository-001"),
          path: "rows/repository-001",
        },
        {
          id: ConfigRowId("repository-commit-001"),
          path: "rows/repository-commit-001",
        },
        {
          id: ConfigRowId("user-001"),
          path: "rows/user-001",
        },
      ],
    },
  ],)
}

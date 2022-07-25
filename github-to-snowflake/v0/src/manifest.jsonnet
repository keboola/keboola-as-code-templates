{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-git-github"),
  },
  configurations: [
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
  ],
}

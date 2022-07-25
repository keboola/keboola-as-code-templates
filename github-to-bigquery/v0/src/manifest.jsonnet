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
  ],
}

{
  configurations: [
    {
      componentId: "keboola.ex-github",
      id: ConfigId("data-source-in-git-github"),
      path: "extractor/keboola.ex-github/data-source-in-git-github",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation1-organization-user-in-git-github"),
      path: "transformation/keboola.snowflake-transformation/transformation1-organization-user-in-git-github",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation2-output-tables-creation-in-git-github"),
      path: "transformation/keboola.snowflake-transformation/transformation2-output-tables-creation-in-git-github",
      rows: [],
    },
    {
      componentId: "keboola.google-bigquery-transformation",
      id: ConfigId("transformation1-organization-user-in-git-github_bq"),
      path: "transformation/keboola.google-bigquery-transformation/transformation1-organization-user-in-git-github_bq",
      metadata: {
        "KBC.configuration.folderName": "GIT-GITHUB",
      },
      rows: [],
    },
    {
      componentId: "keboola.google-bigquery-transformation",
      id: ConfigId("transformation2-output-tables-creation-in-git-github_bq"),
      path: "transformation/keboola.google-bigquery-transformation/transformation2-output-tables-creation-in-git-github_bq",
      metadata: {
        "KBC.configuration.folderName": "GIT-GITHUB",
      },
    },
  ],
}

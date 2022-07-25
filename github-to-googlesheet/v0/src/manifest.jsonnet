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
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("data-destination-out-git-gsheet"),
      path: "<common>/out-git-gsheet/writer/keboola.wr-google-sheets/data-destination-out-git-gsheet",
      rows: [],
    },
  ],
}

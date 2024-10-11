{
  configurations: [
    {
      componentId: "kds-team.ex-asana-v2",
      id: ConfigId("data-source-in-mgmt-asana"),
      path: "extractor/kds-team.ex-asana-v2/data-source-in-mgmt-asana",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation1-user-project"),
      path: "transformation/keboola.snowflake-transformation/transformation1-user-project",
      metadata: {
        "KBC.configuration.folderName": "[MGMT-ASANA]",
      },
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation2-tasks"),
      path: "transformation/keboola.snowflake-transformation/transformation2-tasks",
      metadata: {
        "KBC.configuration.folderName": "[MGMT-ASANA]",
      },
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation3-snapshots"),
      path: "transformation/keboola.snowflake-transformation/transformation3-snapshots",
      metadata: {
        "KBC.configuration.folderName": "[MGMT-ASANA]",
      },
      rows: [],
    },
  ],
}

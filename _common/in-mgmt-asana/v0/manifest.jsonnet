{ 
  configurations: [
    {
      componentId: "leochan.ex-asana",
      id: ConfigId("data-source-in-mgmt-asana"),
      path: "extractor/leochan.ex-asana/data-source-in-mgmt-asana",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation1-first-phase-in-mgmt-asana"),
      path: "transformation/keboola.snowflake-transformation/transformation1-first-phase-in-mgmt-asana",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[MGMT-ASANA]"}
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation2-second-phase-in-mgmt-asana"),
      path: "transformation/keboola.snowflake-transformation/transformation2-second-phase-in-mgmt-asana",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[MGMT-ASANA]"}
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation3-snapshots-in-mgmt-asana"),
      path: "transformation/keboola.snowflake-transformation/transformation3-snapshots-in-mgmt-asana",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[MGMT-ASANA]"}
    },
  ],
}

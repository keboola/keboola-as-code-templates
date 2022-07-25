{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-mgmt-asana"),
  },
  configurations: [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("flow-mgmt-asana"),
      path: "other/keboola.orchestrator/flow-mgmt-asana",
      rows: [],
    },
    {
      componentId: "leochan.ex-asana",
      id: ConfigId("data-source-in-mgmt-asana"),
      path: "<common>/in-mgmt-asana/extractor/leochan.ex-asana/data-source-in-mgmt-asana",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation1-first-phase-in-mgmt-asana"),
      path: "<common>/in-mgmt-asana/transformation/keboola.snowflake-transformation/transformation1-first-phase-in-mgmt-asana",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[MGMT-ASANA]"}
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation2-second-phase-in-mgmt-asana"),
      path: "<common>/in-mgmt-asana/transformation/keboola.snowflake-transformation/transformation2-second-phase-in-mgmt-asana",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[MGMT-ASANA]"}
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation3-snapshots-in-mgmt-asana"),
      path: "<common>/in-mgmt-asana/transformation/keboola.snowflake-transformation/transformation3-snapshots-in-mgmt-asana",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[MGMT-ASANA]"}
    },
    
    if InputIsAvailable("google-sheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("data-destination-out-mgmt-gsheet"),
      path: "<common>/out-mgmt-gsheet/writer/keboola.wr-google-sheets/data-destination-out-mgmt-gsheet",
      rows: [],
    },
  ],
}

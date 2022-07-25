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
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-mgmt-bigquery"),
      path: "<common>/out-mgmt-bigquery/writer/keboola.wr-google-bigquery-v2/data-destination-out-mgmt-bigquery",
      rows: [
        {
          id: ConfigRowId("project"),
          path: "rows/project",
        },
        {
          id: ConfigRowId("project-snapshot"),
          path: "rows/project-snapshot",
        },
        {
          id: ConfigRowId("project-user"),
          path: "rows/project-user",
        },
        {
          id: ConfigRowId("task"),
          path: "rows/task",
        },
        {
          id: ConfigRowId("task-custom-field"),
          path: "rows/task-custom-field",
        },
        {
          id: ConfigRowId("task-event"),
          path: "rows/task-event",
        },
        {
          id: ConfigRowId("task-snapshot"),
          path: "rows/task-snapshot",
        },
        {
          id: ConfigRowId("task-tag"),
          path: "rows/task-tag",
        },
        {
          id: ConfigRowId("task-user"),
          path: "rows/task-user",
        },
        {
          id: ConfigRowId("user"),
          path: "rows/user",
        },
      ],
    },
  ],
}

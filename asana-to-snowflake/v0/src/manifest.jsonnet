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
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("data-destination-out-mgmt-snowflake"),
      path: "<common>/out-mgmt-snowflake/writer/keboola.wr-snowflake-blob-storage/data-destination-out-mgmt-snowflake",
      rows: [
        {
          id: ConfigRowId("project-001"),
          path: "rows/project-001",
        },
        {
          id: ConfigRowId("project-snapshot-001"),
          path: "rows/project-snapshot-001",
        },
        {
          id: ConfigRowId("project-user-001"),
          path: "rows/project-user-001",
        },
        {
          id: ConfigRowId("task-001"),
          path: "rows/task-001",
        },
        {
          id: ConfigRowId("task-custom-field-001"),
          path: "rows/task-custom-field-001",
        },
        {
          id: ConfigRowId("task-event-001"),
          path: "rows/task-event-001",
        },
        {
          id: ConfigRowId("task-snapshot-001"),
          path: "rows/task-snapshot-001",
        },
        {
          id: ConfigRowId("task-tag-001"),
          path: "rows/task-tag-001",
        },
        {
          id: ConfigRowId("task-user-001"),
          path: "rows/task-user-001",
        },
        {
          id: ConfigRowId("user-001"),
          path: "rows/user-001",
        },
      ],
    },
  ],
}

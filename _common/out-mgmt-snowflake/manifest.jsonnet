{ 
  configurations: [
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("data-destination-out-mgmt-snowflake"),
      path: "writer/keboola.wr-snowflake-blob-storage/data-destination-out-mgmt-snowflake",
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

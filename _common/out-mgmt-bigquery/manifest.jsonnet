{ 
  configurations: [
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-mgmt-bigquery"),
      path: "writer/keboola.wr-google-bigquery-v2/data-destination-out-mgmt-bigquery",
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

{
  configurations: [
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("templates-pm-postgre-rs"),
      path: "writer/keboola.wr-db-pgsql/templates-pm-postgre-rs",
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

{ 
  configurations: [
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("data-destination-out-git-snowflake"),
      path: "writer/keboola.wr-snowflake-blob-storage/data-destination-out-git-snowflake",
      rows: [
        {
          id: ConfigRowId("event-001"),
          path: "rows/event-001",
        },
        {
          id: ConfigRowId("issue-001"),
          path: "rows/issue-001",
        },
        {
          id: ConfigRowId("issue-comment-001"),
          path: "rows/issue-comment-001",
        },
        {
          id: ConfigRowId("organization-001"),
          path: "rows/organization-001",
        },
        {
          id: ConfigRowId("organization-user-001"),
          path: "rows/organization-user-001",
        },
        {
          id: ConfigRowId("pull-request-001"),
          path: "rows/pull-request-001",
        },
        {
          id: ConfigRowId("pull-request-activity-001"),
          path: "rows/pull-request-activity-001",
        },
        {
          id: ConfigRowId("repository-001"),
          path: "rows/repository-001",
        },
        {
          id: ConfigRowId("repository-commit-001"),
          path: "rows/repository-commit-001",
        },
        {
          id: ConfigRowId("user-001"),
          path: "rows/user-001",
        },
      ],
    },
  ],
}

{ 
  configurations: [
     {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-git-bigquery"),
      path: "writer/keboola.wr-google-bigquery-v2/data-destination-out-git-bigquery",
      rows: [
        {
          id: ConfigRowId("event"),
          path: "rows/event",
        },
        {
          id: ConfigRowId("issue"),
          path: "rows/issue",
        },
        {
          id: ConfigRowId("issue-comment"),
          path: "rows/issue-comment",
        },
        {
          id: ConfigRowId("organization"),
          path: "rows/organization",
        },
        {
          id: ConfigRowId("organization-user"),
          path: "rows/organization-user",
        },
        {
          id: ConfigRowId("pull-request"),
          path: "rows/pull-request",
        },
        {
          id: ConfigRowId("pull-request-activity"),
          path: "rows/pull-request-activity",
        },
        {
          id: ConfigRowId("repository"),
          path: "rows/repository",
        },
        {
          id: ConfigRowId("repository-commit"),
          path: "rows/repository-commit",
        },
        {
          id: ConfigRowId("user"),
          path: "rows/user",
        },
      ],
    },
  ],
}

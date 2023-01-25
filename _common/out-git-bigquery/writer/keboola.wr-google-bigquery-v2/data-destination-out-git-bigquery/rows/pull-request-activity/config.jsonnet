{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-git-bdm-" + InstanceIdShort() + ".pull_request_activity",
          destination: "out.c-git-bdm-" + InstanceIdShort() + ".pull_request_activity.csv",
          changed_since: "adaptive",
          columns: [
            "pull_request_activity_id",
            "pull_request_id",
            "user_id",
            "user",
            "date",
            "state",
            "title",
            "description",
            "reason",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "PULL_REQUEST_ACTIVITY",
        tableId: "out.c-git-bdm-" + InstanceIdShort() + ".pull_request_activity",
        incremental: true,
        items: [
          {
            name: "pull_request_activity_id",
            dbName: "pull_request_activity_id",
            type: "STRING",
          },
          {
            name: "pull_request_id",
            dbName: "pull_request_id",
            type: "STRING",
          },
          {
            name: "user_id",
            dbName: "user_id",
            type: "STRING",
          },
          {
            name: "user",
            dbName: "user",
            type: "STRING",
          },
          {
            name: "date",
            dbName: "date",
            type: "TIMESTAMP",
          },
          {
            name: "state",
            dbName: "state",
            type: "STRING",
          },
          {
            name: "title",
            dbName: "title",
            type: "STRING",
          },
          {
            name: "description",
            dbName: "description",
            type: "STRING",
          },
          {
            name: "reason",
            dbName: "reason",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

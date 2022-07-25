{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-git-bdm-" + InstanceIdShort() + ".pull_request",
          destination: "out.c-git-bdm-" + InstanceIdShort() + ".pull_request.csv",
          changed_since: "adaptive",
          columns: [
            "pull_request_id",
            "repository_id",
            "user_id",
            "title",
            "description",
            "state",
            "created_on",
            "updated_on",
            "url",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "PULL_REQUEST",
        tableId: "out.c-git-bdm-" + InstanceIdShort() + ".pull_request",
        incremental: true,
        items: [
          {
            name: "pull_request_id",
            dbName: "pull_request_id",
            type: "STRING",
          },
          {
            name: "repository_id",
            dbName: "repository_id",
            type: "STRING",
          },
          {
            name: "user_id",
            dbName: "user_id",
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
            name: "state",
            dbName: "state",
            type: "STRING",
          },
          {
            name: "created_on",
            dbName: "created_on",
            type: "TIMESTAMP",
          },
          {
            name: "updated_on",
            dbName: "updated_on",
            type: "TIMESTAMP",
          },
          {
            name: "url",
            dbName: "url",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-git-bdm-" + InstanceIdShort() + ".repository_commit",
          destination: "out.c-git-bdm-" + InstanceIdShort() + ".repository_commit.csv",
          changed_since: "adaptive",
          columns: [
            "repository_commit_id",
            "repository_id",
            "user_id",
            "date",
            "url",
            "message",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "REPOSITORY_COMMIT",
        tableId: "out.c-git-bdm-" + InstanceIdShort() + ".repository_commit",
        incremental: true,
        items: [
          {
            name: "repository_commit_id",
            dbName: "repository_commit_id",
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
            name: "date",
            dbName: "date",
            type: "TIMESTAMP",
          },
          {
            name: "url",
            dbName: "url",
            type: "STRING",
          },
          {
            name: "message",
            dbName: "message",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

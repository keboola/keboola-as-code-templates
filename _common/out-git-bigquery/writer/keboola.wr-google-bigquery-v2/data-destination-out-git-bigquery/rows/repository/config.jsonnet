{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-git-bdm-" + InstanceIdShort() + ".repository",
          destination: "out.c-git-bdm-" + InstanceIdShort() + ".repository.csv",
          changed_since: "adaptive",
          columns: [
            "repository_id",
            "repository",
            "project",
            "description",
            "language",
            "has_wiki",
            "has_issues",
            "is_private",
            "created_on",
            "url",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "REPOSITORY",
        tableId: "out.c-git-bdm-" + InstanceIdShort() + ".repository",
        incremental: true,
        items: [
          {
            name: "repository_id",
            dbName: "repository_id",
            type: "STRING",
          },
          {
            name: "repository",
            dbName: "repository",
            type: "STRING",
          },
          {
            name: "project",
            dbName: "project",
            type: "STRING",
          },
          {
            name: "description",
            dbName: "description",
            type: "STRING",
          },
          {
            name: "language",
            dbName: "language",
            type: "STRING",
          },
          {
            name: "has_wiki",
            dbName: "has_wiki",
            type: "STRING",
          },
          {
            name: "has_issues",
            dbName: "has_issues",
            type: "STRING",
          },
          {
            name: "is_private",
            dbName: "is_private",
            type: "STRING",
          },
          {
            name: "created_on",
            dbName: "created_on",
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

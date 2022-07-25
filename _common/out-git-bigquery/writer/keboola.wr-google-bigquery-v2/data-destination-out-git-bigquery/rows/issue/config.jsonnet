{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-git-bdm-" + InstanceIdShort() + ".issue",
          destination: "out.c-git-bdm-" + InstanceIdShort() + ".issue.csv",
          changed_since: "adaptive",
          columns: [
            "issue_id",
            "repository_id",
            "user_id",
            "reporter",
            "number",
            "title",
            "description",
            "state",
            "priority",
            "kind",
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
        dbName: "ISSUE",
        tableId: "out.c-git-bdm-" + InstanceIdShort() + ".issue",
        incremental: true,
        items: [
          {
            name: "issue_id",
            dbName: "issue_id",
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
            name: "reporter",
            dbName: "reporter",
            type: "STRING",
          },
          {
            name: "number",
            dbName: "number",
            type: "INTEGER",
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
            name: "priority",
            dbName: "priority",
            type: "STRING",
          },
          {
            name: "kind",
            dbName: "kind",
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

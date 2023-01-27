{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-git-bdm-" + InstanceIdShort() + ".issue_comment",
          destination: "out.c-git-bdm-" + InstanceIdShort() + ".issue_comment.csv",
          changed_since: "adaptive",
          columns: [
            "issue_comment_id",
            "issue_id",
            "user_id",
            "user",
            "description",
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
        dbName: "ISSUE_COMMENT",
        tableId: "out.c-git-bdm-" + InstanceIdShort() + ".issue_comment",
        incremental: true,
        items: [
          {
            name: "issue_comment_id",
            dbName: "issue_comment_id",
            type: "STRING",
          },
          {
            name: "issue_id",
            dbName: "issue_id",
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
            name: "description",
            dbName: "description",
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

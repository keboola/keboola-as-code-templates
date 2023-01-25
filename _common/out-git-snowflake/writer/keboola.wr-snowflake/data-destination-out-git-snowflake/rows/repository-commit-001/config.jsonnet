{
  parameters: {
    tableId: "out.c-git-bdm-" + InstanceIdShort() + ".repository_commit",
    dbName: "REPOSITORY_COMMIT",
    incremental: true,
    primaryKey: [
      "REPOSITORY_COMMIT_ID",
    ],
    items: [
      {
        name: "repository_commit_id",
        dbName: "REPOSITORY_COMMIT_ID",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "repository_id",
        dbName: "REPOSITORY_ID",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "user_id",
        dbName: "USER_ID",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "date",
        dbName: "DATE",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "url",
        dbName: "URL",
        type: "string",
        nullable: false,
        default: "",
        size: "1000",
      },
      {
        name: "message",
        dbName: "MESSAGE",
        type: "string",
        nullable: false,
        default: "",
        size: "1024",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-git-bdm-" + InstanceIdShort() + ".repository_commit",
          destination: "out.c-git-bdm-" + InstanceIdShort() + ".repository_commit.csv",
          columns: [
            "repository_commit_id",
            "repository_id",
            "user_id",
            "date",
            "url",
            "message",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

{
  parameters: {
    tableId: "out.c-git-bdm-" + InstanceIdShort() + ".repository_commit",
    dbName: "repository_commit",
    incremental: false,
    primaryKey: [
      "repository_commit_id",
    ],
    items: [
      {
        name: "repository_commit_id",
        dbName: "repository_commit_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "repository_id",
        dbName: "repository_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "user_id",
        dbName: "user_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "date",
        dbName: "date",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "url",
        dbName: "url",
        type: "varchar",
        nullable: true,
        default: "",
        size: "1000",
      },
      {
        name: "message",
        dbName: "message",
        type: "varchar",
        nullable: true,
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

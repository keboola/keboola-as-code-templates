{
  parameters: {
    tableId: "out.c-git-bdm-" + InstanceIdShort() + ".issue",
    dbName: "issue",
    incremental: false,
    primaryKey: [
      "issue_id",
    ],
    items: [
      {
        name: "issue_id",
        dbName: "issue_id",
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
        name: "reporter",
        dbName: "reporter",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "number",
        dbName: "number",
        type: "integer",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "title",
        dbName: "title",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "description",
        dbName: "description",
        type: "varchar",
        nullable: true,
        default: "",
        size: "1024",
      },
      {
        name: "state",
        dbName: "state",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "priority",
        dbName: "priority",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "kind",
        dbName: "kind",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "created_on",
        dbName: "created_on",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "updated_on",
        dbName: "updated_on",
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
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-git-bdm-" + InstanceIdShort() + ".issue",
          destination: "out.c-git-bdm-" + InstanceIdShort() + ".issue.csv",
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
          changed_since: "adaptive",
        },
      ],
    },
  },
}

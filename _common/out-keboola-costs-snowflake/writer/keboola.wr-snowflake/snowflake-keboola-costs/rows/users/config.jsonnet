{
  parameters: {
    tableId: "out.c-keboola-costs.users",
    dbName: "users",
    incremental: true,
    primaryKey: [
      "user_id",
    ],
    items: [
      {
        name: "user_id",
        dbName: "user_id",
        type: "text",
        nullable: false,
        default: "",
        size: "1000",
      },
      {
        name: "kbc_project_id",
        dbName: "project_id",
        type: "text",
        nullable: false,
        default: "",
        size: "1000",
      },
      {
        name: "email",
        dbName: "user_email",
        type: "text",
        nullable: true,
        default: "",
        size: "1000",
      },
      {
        name: "domain",
        dbName: "user_domain",
        type: "text",
        nullable: true,
        default: "",
        size: "1000",
      },
      {
        name: "valid_from",
        dbName: "user_valid_from",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "valid_to",
        dbName: "user_valid_to",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.users",
          destination: "out.c-keboola-costs.users.csv",
          columns: [
            "user_id",
            "kbc_project_id",
            "email",
            "domain",
            "valid_from",
            "valid_to"
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

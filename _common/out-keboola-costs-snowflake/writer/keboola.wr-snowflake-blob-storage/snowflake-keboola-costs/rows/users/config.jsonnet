{
  parameters: {
    tableId: "out.c-keboola-costs.users",
    dbName: "users",
    incremental: true,
    primaryKey: [],
    items: [
      {
        name: "user_id",
        dbName: "user_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "16777216",
      },
      {
        name: "user_email",
        dbName: "user_email",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "user_name",
        dbName: "user_name",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "user_domain",
        dbName: "user_domain",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "mfa_enabled",
        dbName: "mfa_enabled",
        type: "boolean",
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
            "user_email",
            "user_name",
            "user_domain",
            "mfa_enabled",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

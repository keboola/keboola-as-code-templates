{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.users",
          destination: "out.c-keboola-costs.users.csv",
          changed_since: "adaptive",
          columns: [
            "user_id",
            "user_email",
            "user_name",
            "user_domain",
            "mfa_enabled",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "users",
        tableId: "out.c-keboola-costs.users",
        incremental: true,
        items: [
          {
            name: "user_id",
            dbName: "user_id",
            type: "STRING",
          },
          {
            name: "user_email",
            dbName: "user_email",
            type: "STRING",
          },
          {
            name: "user_name",
            dbName: "user_name",
            type: "STRING",
          },
          {
            name: "user_domain",
            dbName: "user_domain",
            type: "STRING",
          },
          {
            name: "mfa_enabled",
            dbName: "mfa_enabled",
            type: "BOOLEAN",
          },
        ],
      },
    ],
  },
}

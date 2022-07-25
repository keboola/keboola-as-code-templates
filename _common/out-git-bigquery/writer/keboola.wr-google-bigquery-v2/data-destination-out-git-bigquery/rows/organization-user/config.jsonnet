{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-git-bdm-" + InstanceIdShort() + ".organization_user",
          destination: "out.c-git-bdm-" + InstanceIdShort() + ".organization_user.csv",
          changed_since: "adaptive",
          columns: [
            "organization_id",
            "user_id",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "ORGANIZATION_USER",
        tableId: "out.c-git-bdm-" + InstanceIdShort() + ".organization_user",
        incremental: true,
        items: [
          {
            name: "organization_id",
            dbName: "organization_id",
            type: "STRING",
          },
          {
            name: "user_id",
            dbName: "user_id",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

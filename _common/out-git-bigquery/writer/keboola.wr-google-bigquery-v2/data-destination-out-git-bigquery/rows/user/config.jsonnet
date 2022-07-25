{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-git-tr-" + InstanceIdShort() + ".user",
          destination: "out.c-git-tr-" + InstanceIdShort() + ".user.csv",
          changed_since: "adaptive",
          columns: [
            "user_id",
            "user",
            "created_on",
            "type",
            "is_active",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "USER",
        tableId: "out.c-git-tr-" + InstanceIdShort() + ".user",
        incremental: true,
        items: [
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
            name: "created_on",
            dbName: "created_on",
            type: "TIMESTAMP",
          },
          {
            name: "type",
            dbName: "type",
            type: "STRING",
          },
          {
            name: "is_active",
            dbName: "is_active",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

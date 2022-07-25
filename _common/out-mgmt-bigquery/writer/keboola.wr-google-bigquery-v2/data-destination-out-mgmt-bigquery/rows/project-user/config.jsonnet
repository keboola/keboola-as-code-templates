{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_user",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_user.csv",
          changed_since: "adaptive",
          columns: [
            "user_id",
            "project_id",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "PROJECT_USER",
        tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_user",
        incremental: true,
        items: [
          {
            name: "user_id",
            dbName: "USER_ID",
            type: "STRING",
          },
          {
            name: "project_id",
            dbName: "PROJECT_ID",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_user",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_user.csv",
          changed_since: "adaptive",
          columns: [
            "user_id",
            "task_id",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "TASK_USER",
        tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_user",
        incremental: true,
        items: [
          {
            name: "user_id",
            dbName: "USER_ID",
            type: "STRING",
          },
          {
            name: "task_id",
            dbName: "TASK_ID",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

{
  parameters: {
    tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_user",
    dbName: "task_user",
    incremental: false,
    primaryKey: [
      "user_id",
      "task_id",
    ],
    items: [
      {
        name: "user_id",
        dbName: "user_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "task_id",
        dbName: "task_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_user",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_user.csv",
          columns: [
            "user_id",
            "task_id",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

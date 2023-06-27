{
  parameters: {
    tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_user",
    dbName: "project_user",
    incremental: false,
    primaryKey: [
      "user_id",
      "project_id",
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
        name: "project_id",
        dbName: "project_id",
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
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_user",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_user.csv",
          columns: [
            "user_id",
            "project_id",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

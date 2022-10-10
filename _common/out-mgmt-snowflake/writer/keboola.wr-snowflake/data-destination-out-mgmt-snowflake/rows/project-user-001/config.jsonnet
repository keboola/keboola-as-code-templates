{
  parameters: {
    tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".project_user",
    dbName: "PROJECT_USER",
    incremental: true,
    primaryKey: [
      "USER_ID",
      "PROJECT_ID",
    ],
    items: [
      {
        name: "user_id",
        dbName: "USER_ID",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "project_id",
        dbName: "PROJECT_ID",
        type: "string",
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

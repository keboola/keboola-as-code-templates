{
  parameters: {
    tableId: "out.c-git-tr-" + InstanceIdShort() + ".user",
    dbName: "USER",
    incremental: true,
    primaryKey: [
      "USER_ID",
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
        name: "user",
        dbName: "USER",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "created_on",
        dbName: "CREATED_ON",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "type",
        dbName: "TYPE",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "is_active",
        dbName: "IS_ACTIVE",
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
          source: "out.c-git-tr-" + InstanceIdShort() + ".user",
          destination: "out.c-git-tr-" + InstanceIdShort() + ".user.csv",
          columns: [
            "user_id",
            "user",
            "created_on",
            "type",
            "is_active",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

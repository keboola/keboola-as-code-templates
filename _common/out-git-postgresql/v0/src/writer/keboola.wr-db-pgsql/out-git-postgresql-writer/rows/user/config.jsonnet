{
  parameters: {
    tableId: "out.c-git-tr-" + InstanceIdShort() + ".user",
    dbName: "user",
    incremental: false,
    primaryKey: [
      "user_id",
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
        name: "user",
        dbName: "user",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "created_on",
        dbName: "created_on",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "type",
        dbName: "type",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "is_active",
        dbName: "is_active",
        type: "varchar",
        nullable: true,
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

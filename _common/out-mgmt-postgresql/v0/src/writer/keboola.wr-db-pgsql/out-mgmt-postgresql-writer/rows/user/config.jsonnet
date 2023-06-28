{
  parameters: {
    tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".user",
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
        name: "email",
        dbName: "email",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "email_domain",
        dbName: "email_domain",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "user_type",
        dbName: "user_type",
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
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".user",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".user.csv",
          columns: [
            "user_id",
            "user",
            "email",
            "email_domain",
            "user_type",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

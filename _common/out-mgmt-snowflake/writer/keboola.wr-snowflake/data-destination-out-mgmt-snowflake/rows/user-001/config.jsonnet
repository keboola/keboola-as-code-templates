{
  parameters: {
    tableId: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".user",
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
        name: "email",
        dbName: "EMAIL",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "email_domain",
        dbName: "EMAIL_DOMAIN",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "user_type",
        dbName: "USER_TYPE",
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
          source: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".user",
          destination: "out.c-projectmgmt-tr-" + InstanceIdShort() + ".user.csv",
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

{
  parameters: {
    tableId: "out.c-git-bdm-" + InstanceIdShort() + ".organization_user",
    dbName: "ORGANIZATION_USER",
    incremental: true,
    primaryKey: [
      "ORGANIZATION_ID",
      "USER_ID",
    ],
    items: [
      {
        name: "organization_id",
        dbName: "ORGANIZATION_ID",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "user_id",
        dbName: "USER_ID",
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
          source: "out.c-git-bdm-" + InstanceIdShort() + ".organization_user",
          destination: "out.c-git-bdm-" + InstanceIdShort() + ".organization_user.csv",
          columns: [
            "organization_id",
            "user_id",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

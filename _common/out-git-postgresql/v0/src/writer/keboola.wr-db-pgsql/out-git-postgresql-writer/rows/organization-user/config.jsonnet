{
  parameters: {
    tableId: "out.c-git-bdm-" + InstanceIdShort() + ".organization_user",
    dbName: "organization_user",
    incremental: false,
    primaryKey: [
      "organization_id",
      "user_id",
    ],
    items: [
      {
        name: "organization_id",
        dbName: "organization_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "user_id",
        dbName: "user_id",
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

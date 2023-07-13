{
  parameters: {
    tableId: "out.c-git-tr-" + InstanceIdShort() + ".organization",
    dbName: "organization",
    incremental: false,
    primaryKey: [
      "organization_id",
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
        name: "organization",
        dbName: "organization",
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
          source: "out.c-git-tr-" + InstanceIdShort() + ".organization",
          destination: "out.c-git-tr-" + InstanceIdShort() + ".organization.csv",
          columns: [
            "organization_id",
            "organization",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

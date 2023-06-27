{
  parameters: {
    tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_tag",
    dbName: "task_tag",
    incremental: false,
    primaryKey: [
      "task_id",
      "tag",
    ],
    items: [
      {
        name: "task_id",
        dbName: "task_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "tag",
        dbName: "tag",
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
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_tag",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_tag.csv",
          columns: [
            "task_id",
            "tag",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

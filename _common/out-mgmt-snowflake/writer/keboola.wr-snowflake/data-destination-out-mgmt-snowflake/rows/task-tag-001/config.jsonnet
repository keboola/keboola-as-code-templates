{
  parameters: {
    tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_tag",
    dbName: "TASK_TAG",
    incremental: true,
    primaryKey: [
      "TASK_ID",
      "TAG",
    ],
    items: [
      {
        name: "task_id",
        dbName: "TASK_ID",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "tag",
        dbName: "TAG",
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

{
  parameters: {
    tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_custom_field",
    dbName: "task_custom_field",
    incremental: false,
    primaryKey: [
      "task_custom_field_id",
    ],
    items: [
      {
        name: "task_custom_field_id",
        dbName: "task_custom_field_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "task_id",
        dbName: "task_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "task_custom_field",
        dbName: "task_custom_field",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "task_custom_field_value",
        dbName: "task_custom_field_value",
        type: "varchar",
        nullable: true,
        default: "",
        size: "30000",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_custom_field",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_custom_field.csv",
          columns: [
            "task_custom_field_id",
            "task_id",
            "task_custom_field",
            "task_custom_field_value",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

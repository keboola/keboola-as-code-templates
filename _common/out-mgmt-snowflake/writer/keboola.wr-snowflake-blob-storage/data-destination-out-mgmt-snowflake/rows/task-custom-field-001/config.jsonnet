{
  parameters: {
    tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_custom_field",
    dbName: "TASK_CUSTOM_FIELD",
    incremental: true,
    primaryKey: [
      "TASK_CUSTOM_FIELD_ID",
    ],
    items: [
      {
        name: "task_custom_field_id",
        dbName: "TASK_CUSTOM_FIELD_ID",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "task_id",
        dbName: "TASK_ID",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "task_custom_field",
        dbName: "TAKS_CUSTOM_FIELD",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "task_custom_field_value",
        dbName: "TASK_CUSTOM_FIELD_VALUE",
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

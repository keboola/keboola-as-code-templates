{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_custom_field",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_custom_field.csv",
          changed_since: "adaptive",
          columns: [
            "task_custom_field_id",
            "task_id",
            "task_custom_field",
            "task_custom_field_value",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "TASK_CUSTOM_FIELD",
        tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_custom_field",
        incremental: true,
        items: [
          {
            name: "task_custom_field_id",
            dbName: "TASK_CUSTOM_FIELD_ID",
            type: "STRING",
          },
          {
            name: "task_id",
            dbName: "TASK_ID",
            type: "STRING",
          },
          {
            name: "task_custom_field",
            dbName: "TASK_CUSTOM_FIELD",
            type: "STRING",
          },
          {
            name: "task_custom_field_value",
            dbName: "TASK_CUSTOM_FIELD_VALUE",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

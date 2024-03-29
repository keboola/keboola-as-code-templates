{
  parameters: {
    tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_event",
    dbName: "TASK_EVENT",
    incremental: true,
    primaryKey: [
      "TASK_EVENT_ID",
    ],
    items: [
      {
        name: "task_event_id",
        dbName: "TASK_EVENT_ID",
        type: "string",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "task_id",
        dbName: "TASK_ID",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "user_id",
        dbName: "USER_ID",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "user_type",
        dbName: "USER_TYPE",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "user",
        dbName: "USER",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "created_at",
        dbName: "CREATED_AT",
        type: "datetime",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "event_type",
        dbName: "EVENT_TYPE",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "event",
        dbName: "EVENT",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "event_text",
        dbName: "EVENT_TEXT",
        type: "string",
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
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_event",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_event.csv",
          columns: [
            "task_event_id",
            "task_id",
            "user_id",
            "user_type",
            "user",
            "created_at",
            "event_type",
            "event",
            "event_text",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

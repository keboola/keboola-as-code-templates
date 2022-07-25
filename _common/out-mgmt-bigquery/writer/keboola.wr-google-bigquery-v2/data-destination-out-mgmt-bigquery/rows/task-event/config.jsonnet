{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_event",
          destination: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_event.csv",
          changed_since: "adaptive",
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
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "TASK_EVENT",
        tableId: "out.c-projectmgmt-bdm-" + InstanceIdShort() + ".task_event",
        incremental: true,
        items: [
          {
            name: "task_event_id",
            dbName: "TASK_EVENT_ID",
            type: "STRING",
          },
          {
            name: "task_id",
            dbName: "TASK_ID",
            type: "STRING",
          },
          {
            name: "user_id",
            dbName: "USER_ID",
            type: "STRING",
          },
          {
            name: "user_type",
            dbName: "USER_TYPE",
            type: "STRING",
          },
          {
            name: "user",
            dbName: "USER",
            type: "STRING",
          },
          {
            name: "created_at",
            dbName: "CREATED_AT",
            type: "STRING",
          },
          {
            name: "event_type",
            dbName: "EVENT_TYPE",
            type: "STRING",
          },
          {
            name: "event",
            dbName: "EVENT",
            type: "STRING",
          },
          {
            name: "event_text",
            dbName: "EVENT_TEXT",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

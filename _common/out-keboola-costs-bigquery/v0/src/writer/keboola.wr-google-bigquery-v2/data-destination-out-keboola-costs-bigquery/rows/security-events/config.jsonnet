{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-keboola-costs.security_events",
          destination: "out.c-keboola-costs.security_events.csv",
          changed_since: "adaptive",
          columns: [
            "security_event_id",
            "project_id",
            "admin_email",
            "admin_name",
            "admin_ip",
            "security_event",
            "event_created_date",
            "token_context",
            "admin_context",
            "event_context",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "security_events",
        tableId: "out.c-keboola-costs.security_events",
        incremental: true,
        items: [
          {
            name: "security_event_id",
            dbName: "security_event_id",
            type: "STRING",
          },
          {
            name: "project_id",
            dbName: "project_id",
            type: "STRING",
          },
          {
            name: "admin_email",
            dbName: "admin_email",
            type: "STRING",
          },
          {
            name: "admin_name",
            dbName: "admin_name",
            type: "STRING",
          },
          {
            name: "admin_ip",
            dbName: "admin_ip",
            type: "STRING",
          },
          {
            name: "security_event",
            dbName: "security_event",
            type: "STRING",
          },
          {
            name: "event_created_date",
            dbName: "event_created_date",
            type: "STRING",
          },
          {
            name: "token_context",
            dbName: "token_context",
            type: "STRING",
          },
          {
            name: "admin_context",
            dbName: "admin_context",
            type: "STRING",
          },
          {
            name: "event_context",
            dbName: "event_context",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

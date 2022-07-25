{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-typeform-" + InstanceIdShort() + ".responses",
          destination: "out.c-typeform-" + InstanceIdShort() + ".responses.csv",
          changed_since: "adaptive",
          columns: [
            "response_id",
            "session_id",
            "question_id",
            "answer_option_id",
            "ip_address",
            "recipient_id",
            "date_created",
            "response_status",
            "response_text",
            "type_pivot",
            "field_type",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "responses",
        tableId: "out.c-typeform-" + InstanceIdShort() + ".responses",
        incremental: true,
        items: [
          {
            name: "response_id",
            dbName: "response_id",
            type: "STRING",
          },
          {
            name: "session_id",
            dbName: "session_id",
            type: "STRING",
          },
          {
            name: "question_id",
            dbName: "question_id",
            type: "STRING",
          },
          {
            name: "answer_option_id",
            dbName: "answer_option_id",
            type: "STRING",
          },
          {
            name: "ip_address",
            dbName: "ip_address",
            type: "STRING",
          },
          {
            name: "recipient_id",
            dbName: "recipient_id",
            type: "STRING",
          },
          {
            name: "date_created",
            dbName: "date_created",
            type: "TIMESTAMP",
          },
          {
            name: "response_status",
            dbName: "response_status",
            type: "STRING",
          },
          {
            name: "response_text",
            dbName: "response_text",
            type: "STRING",
          },
          {
            name: "type_pivot",
            dbName: "type_pivot",
            type: "STRING",
          },
          {
            name: "field_type",
            dbName: "field_type",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

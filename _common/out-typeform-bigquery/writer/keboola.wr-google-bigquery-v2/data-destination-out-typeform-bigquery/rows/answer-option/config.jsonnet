{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-typeform-" + InstanceIdShort() + ".answer_option",
          destination: "out.c-typeform-" + InstanceIdShort() + ".answer_option.csv",
          changed_since: "adaptive",
          columns: [
            "answer_option_id",
            "question_id",
            "question_heading",
            "choice_id",
            "choice_text",
            "field_type",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "answer_option",
        tableId: "out.c-typeform-" + InstanceIdShort() + ".answer_option",
        incremental: true,
        items: [
          {
            name: "answer_option_id",
            dbName: "answer_option_id",
            type: "STRING",
          },
          {
            name: "question_id",
            dbName: "question_id",
            type: "STRING",
          },
          {
            name: "question_heading",
            dbName: "question_heading",
            type: "STRING",
          },
          {
            name: "choice_id",
            dbName: "choice_id",
            type: "STRING",
          },
          {
            name: "choice_text",
            dbName: "choice_text",
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

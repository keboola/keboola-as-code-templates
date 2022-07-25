{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-typeform-" + InstanceIdShort() + ".question",
          destination: "out.c-typeform-" + InstanceIdShort() + ".question.csv",
          changed_since: "adaptive",
          columns: [
            "question_id",
            "survey_id",
            "survey_title",
            "question_heading",
            "description",
            "question_position",
            "question_family",
            "question_subtype",
            "question_is_visible",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "question",
        tableId: "out.c-typeform-" + InstanceIdShort() + ".question",
        incremental: true,
        items: [
          {
            name: "question_id",
            dbName: "question_id",
            type: "STRING",
          },
          {
            name: "survey_id",
            dbName: "survey_id",
            type: "STRING",
          },
          {
            name: "survey_title",
            dbName: "survey_title",
            type: "STRING",
          },
          {
            name: "question_heading",
            dbName: "question_heading",
            type: "STRING",
          },
          {
            name: "description",
            dbName: "description",
            type: "STRING",
          },
          {
            name: "question_position",
            dbName: "question_position",
            type: "STRING",
          },
          {
            name: "question_family",
            dbName: "question_family",
            type: "STRING",
          },
          {
            name: "question_subtype",
            dbName: "question_subtype",
            type: "STRING",
          },
          {
            name: "question_is_visible",
            dbName: "question_is_visible",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

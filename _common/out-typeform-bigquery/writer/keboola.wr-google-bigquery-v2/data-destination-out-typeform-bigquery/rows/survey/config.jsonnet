{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-typeform-" + InstanceIdShort() + ".survey",
          destination: "out.c-typeform-" + InstanceIdShort() + ".survey.csv",
          changed_since: "adaptive",
          columns: [
            "survey_id",
            "survey_title",
            "survey_nickname",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "survey",
        tableId: "out.c-typeform-" + InstanceIdShort() + ".survey",
        incremental: true,
        items: [
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
            name: "survey_nickname",
            dbName: "survey_nickname",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

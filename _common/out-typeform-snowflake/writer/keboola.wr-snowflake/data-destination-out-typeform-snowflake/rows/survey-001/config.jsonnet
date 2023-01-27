{
  parameters: {
    tableId: "out.c-typeform-" + InstanceIdShort() + ".survey",
    dbName: "survey",
    incremental: true,
    primaryKey: [
      "survey_id",
    ],
    items: [
      {
        name: "survey_id",
        dbName: "survey_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "survey_title",
        dbName: "survey_title",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "survey_nickname",
        dbName: "survey_nickname",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-typeform-" + InstanceIdShort() + ".survey",
          destination: "out.c-typeform-" + InstanceIdShort() + ".survey.csv",
          columns: [
            "survey_id",
            "survey_title",
            "survey_nickname",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

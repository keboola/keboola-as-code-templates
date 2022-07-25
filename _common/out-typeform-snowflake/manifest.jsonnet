{ 
  configurations: [
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("data-destination-out-typeform-snowflake"),
      path: "writer/keboola.wr-snowflake-blob-storage/data-destination-out-typeform-snowflake",
      rows: [
        {
          id: ConfigRowId("answer-option-001"),
          path: "rows/answer-option-001",
        },
        {
          id: ConfigRowId("question-001"),
          path: "rows/question-001",
        },
        {
          id: ConfigRowId("responses-001"),
          path: "rows/responses-001",
        },
        {
          id: ConfigRowId("survey-001"),
          path: "rows/survey-001",
        },
      ],
    },
  ],
}

{
  configurations:[
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-typeform-bigquery"),
      path: "writer/keboola.wr-google-bigquery-v2/data-destination-out-typeform-bigquery",
      rows: [
        {
          id: ConfigRowId("answer-option"),
          path: "rows/answer-option",
        },
        {
          id: ConfigRowId("question"),
          path: "rows/question",
        },
        {
          id: ConfigRowId("responses"),
          path: "rows/responses",
        },
        {
          id: ConfigRowId("survey"),
          path: "rows/survey",
        },
      ],
    },
  ],
}

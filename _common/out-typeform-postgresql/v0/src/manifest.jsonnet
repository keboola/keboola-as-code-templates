{
  configurations: [
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("out-typeform-postgresql-writer"),
      path: "writer/keboola.wr-db-pgsql/out-typeform-postgresql-writer",
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

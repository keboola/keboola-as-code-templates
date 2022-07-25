{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-typeform"),
  },
  configurations: [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("flow-typeform"),
      path: "other/keboola.orchestrator/flow-typeform",
      rows: [],
    },
    {
      componentId: "fisa.ex-typeform",
      id: ConfigId("data-source-in-typeform"),
      path: "<common>/in-typeform/extractor/fisa.ex-typeform/data-source-in-typeform",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-in-typeform"),
      path: "<common>/in-typeform/transformation/keboola.snowflake-transformation/transformation-in-typeform",
      rows: [],
    },
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-typeform-bigquery"),
      path: "<common>/out-typeform-bigquery/writer/keboola.wr-google-bigquery-v2/data-destination-out-typeform-bigquery",
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

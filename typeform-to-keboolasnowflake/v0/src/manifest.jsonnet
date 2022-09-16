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
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("data-destination-out-typeform-snowflake"),
      path: "<common>/out-typeform-snowflake/writer/keboola.wr-snowflake-blob-storage/data-destination-out-typeform-snowflake",
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

{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-typeform"),
  },
  configurations: std.filter(function(v) v != null,[
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
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
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
    if InputIsAvailable("google-sheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("data-destination-out-typeform-gsheet"),
      path: "<common>/out-typeform-gsheet/writer/keboola.wr-google-sheets/data-destination-out-typeform-gsheet",
      rows: [],
    },
    if InputIsAvailable("wr-snowflake-blob-storage-db-host") then
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
  ],)
}

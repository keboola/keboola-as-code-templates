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
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("data-destination-out-typeform-gsheet"),
      path: "<common>/out-typeform-gsheet/writer/keboola.wr-google-sheets/data-destination-out-typeform-gsheet",
      rows: [],
    },
  ],
}

{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-keboola-mailchimp"),
  },
  configurations: [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("flow-keboola-mailchimp"),
      path: "other/keboola.orchestrator/flow-keboola-mailchimp",
      rows: [],
    },
    {
      componentId: "keboola.ex-mailchimp",
      id: ConfigId("data-source-1-in-mailchimp"),
      path: "<common>/in-mailchimp/extractor/keboola.ex-mailchimp/data-source-1-in-mailchimp",
      rows: [],
    },
    {
      componentId: "keboola.ex-mailchimp",
      id: ConfigId("data-source-2-in-mailchimp"),
      path: "<common>/in-mailchimp/extractor/keboola.ex-mailchimp/data-source-2-in-mailchimp",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-in-mailchimp"),
      path: "<common>/in-mailchimp/transformation/keboola.snowflake-transformation/transformation-in-mailchimp",
      rows: [],
    },
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("data-destination-out-mailchimp-gsheet"),
      path: "<common>/out-mailchimp-googlesheet/writer/keboola.wr-google-sheets/data-destination-out-mailchimp-gsheet",
      rows: [],
    },
  ],
}

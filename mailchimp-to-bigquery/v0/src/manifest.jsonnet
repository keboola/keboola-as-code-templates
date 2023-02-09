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
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-mailchimp-bigquery"),
      path: "<common>/out-mailchimp-bigquery/writer/keboola.wr-google-bigquery-v2/data-destination-out-mailchimp-bigquery",
      rows: [
        {
          id: ConfigRowId("campaign"),
          path: "rows/campaign",
        },
        {
          id: ConfigRowId("campaign-event"),
          path: "rows/campaign-event",
        },
        {
          id: ConfigRowId("customer"),
          path: "rows/customer",
        },
        {
          id: ConfigRowId("list"),
          path: "rows/list",
        },
        {
          id: ConfigRowId("list-member"),
          path: "rows/list-member",
        },
      ],
    },
  ],
}

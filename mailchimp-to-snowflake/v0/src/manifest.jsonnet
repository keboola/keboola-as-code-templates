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
      componentId: SnowflakeWriterComponentId(),
      id: ConfigId("data-destination-out-mailchimp-snowflake"),
      path: "<common>/out-mailchimp-snowflake/writer/keboola.wr-snowflake-blob-storage/data-destination-out-mailchimp-snowflake",
      rows: [
        {
          id: ConfigRowId("campaign-001"),
          path: "rows/campaign-001",
        },
        {
          id: ConfigRowId("campaign-event-001"),
          path: "rows/campaign-event-001",
        },
        {
          id: ConfigRowId("customer-001"),
          path: "rows/customer-001",
        },
        {
          id: ConfigRowId("list-001"),
          path: "rows/list-001",
        },
        {
          id: ConfigRowId("list-member-001"),
          path: "rows/list-member-001",
        },
      ],
    },
  ],
}

{ 
  configurations: [
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("data-destination-out-mailchimp-snowflake"),
      path: "writer/keboola.wr-snowflake-blob-storage/data-destination-out-mailchimp-snowflake",
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

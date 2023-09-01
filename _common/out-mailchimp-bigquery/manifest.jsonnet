{
  configurations: [
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-mailchimp-bigquery"),
      path: "writer/keboola.wr-google-bigquery-v2/data-destination-out-mailchimp-bigquery",
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

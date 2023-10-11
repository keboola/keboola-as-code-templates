{
  configurations: [
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("out-mailchimp-postgresql-writer"),
      path: "writer/keboola.wr-db-pgsql/out-mailchimp-postgresql-writer",
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

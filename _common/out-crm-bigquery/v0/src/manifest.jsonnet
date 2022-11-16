{
  configurations: [
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-crm-bigquery"),
      path: "writer/keboola.wr-google-bigquery-v2/data-destination-out-crm-bigquery",
      rows: [
        {
          id: ConfigRowId("activity"),
          path: "rows/activity",
        },
        {
          id: ConfigRowId("company"),
          path: "rows/company",
        },
        {
          id: ConfigRowId("contact"),
          path: "rows/contact",
        },
        {
          id: ConfigRowId("employee"),
          path: "rows/employee",
        },
        {
          id: ConfigRowId("opportunity"),
          path: "rows/opportunity",
        },
        {
          id: ConfigRowId("opportunity-contact"),
          path: "rows/opportunity-contact",
        },
        {
          id: ConfigRowId("opportunity-snapshot"),
          path: "rows/opportunity-snapshot",
        },
      ],
    },
  ],
}

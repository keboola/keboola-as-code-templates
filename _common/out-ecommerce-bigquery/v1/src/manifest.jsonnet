{
  configurations: [
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-ecommerce-bigquery"),
      path: "writer/keboola.wr-google-bigquery-v2/data-destination-out-ecommerce-bigquery",
      rows: [
        {
          id: ConfigRowId("bdm-customers"),
          path: "rows/bdm-customers",
        },
        {
          id: ConfigRowId("bdm-order-lines"),
          path: "rows/bdm-order-lines",
        },
        {
          id: ConfigRowId("bdm-orders"),
          path: "rows/bdm-orders",
        },
        {
          id: ConfigRowId("bdm-products"),
          path: "rows/bdm-products",
        },
      ],
    },
  ],
}

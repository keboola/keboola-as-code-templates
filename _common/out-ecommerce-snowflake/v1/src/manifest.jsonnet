{
  configurations: [
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("data-destination-out-ecommerce-snowflake"),
      path: "writer/keboola.wr-snowflake-blob-storage/data-destination-out-ecommerce-snowflake",
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

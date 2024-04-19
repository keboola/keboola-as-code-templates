{
  configurations: [
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("data-destination-out-ecommerce-postgresql"),
      path: "writer/keboola.wr-db-pgsql/data-destination-out-ecommerce-postgresql",
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

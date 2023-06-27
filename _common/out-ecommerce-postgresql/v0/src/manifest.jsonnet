{
  configurations: [
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("templates-e-commerce-shoptet-to-big-query"),
      path: "writer/keboola.wr-db-pgsql/templates-e-commerce-shoptet-to-big-query",
      rows: [
        {
          id: ConfigRowId("bdm-analyze-clv-by-order-count"),
          path: "rows/bdm-analyze-clv-by-order-count",
        },
        {
          id: ConfigRowId("bdm-analyze-clv-by-time-from-previous-order"),
          path: "rows/bdm-analyze-clv-by-time-from-previous-order",
        },
        {
          id: ConfigRowId("bdm-billing-type"),
          path: "rows/bdm-billing-type",
        },
        {
          id: ConfigRowId("bdm-customers"),
          path: "rows/bdm-customers",
        },
        {
          id: ConfigRowId("bdm-marketing-campaign-costs"),
          path: "rows/bdm-marketing-campaign-costs",
        },
        {
          id: ConfigRowId("bdm-marketing-campaign-costs-monthly"),
          path: "rows/bdm-marketing-campaign-costs-monthly",
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
          id: ConfigRowId("bdm-product-margin-over-time"),
          path: "rows/bdm-product-margin-over-time",
        },
        {
          id: ConfigRowId("bdm-products"),
          path: "rows/bdm-products",
        },
        {
          id: ConfigRowId("bdm-rfm"),
          path: "rows/bdm-rfm",
        },
        {
          id: ConfigRowId("bdm-shipping-type"),
          path: "rows/bdm-shipping-type",
        },
        {
          id: ConfigRowId("out-shop"),
          path: "rows/out-shop",
        },
      ],
    },
  ],
}

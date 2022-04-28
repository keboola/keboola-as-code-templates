{
  configurations: [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("keboola-ecommerce-shopify-orchestration-10697799"),
      path: "other/keboola.orchestrator/keboola-ecommerce-shopify-orchestration-10697799",
      rows: [],
    },
    {
      componentId: "kds-team.ex-shopify",
      id: ConfigId("in-ecommerce-shopify-extractor-10697799"),
      path: "<common>/in-ecommerce-shopify/v0/src/extractor/kds-team.ex-shopify/in-ecommerce-shopify-extractor-10697799",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shopify-transformation1-prepare-input-tables-10697799"),
      path: "<common>/in-ecommerce-shopify/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-shopify-transformation1-prepare-input-tables-10697799",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shopify-transformation2-data-preparation-10697799"),
      path: "<common>/in-ecommerce-shopify/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-shopify-transformation2-data-preparation-10697799",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shopify-transformation3-rfm-analysis-10697799"),
      path: "<common>/in-ecommerce-shopify/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-shopify-transformation3-rfm-analysis-10697799",
      rows: [],
    },
    if Input("google-sheet-checkbox") == true then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("out-ecommerce-gsheet-writer-10697799"),
      path: "<common>/out-ecommerce-gsheet/v0/src/writer/keboola.wr-google-sheets/out-ecommerce-gsheet-writer-10697799",
      rows: [],
    }
    else if std.length(Input("wr-snowflake-blob-storage-db-host")) > 0 then
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("out-ecommerce-snowflake-writer-10697799"),
      path: "<common>/out-ecommerce-snowflake/v0/src/writer/keboola.wr-snowflake-blob-storage/out-ecommerce-snowflake-writer-10697799",
      rows: [
        {
          id: ConfigRowId("bdm-analyze-clv-by-order-count-001"),
          path: "rows/bdm-analyze-clv-by-order-count-001",
        },
        {
          id: ConfigRowId("bdm-analyze-clv-by-time-from-previous-order-001"),
          path: "rows/bdm-analyze-clv-by-time-from-previous-order-001",
        },
        {
          id: ConfigRowId("bdm-billing-type-001"),
          path: "rows/bdm-billing-type-001",
        },
        {
          id: ConfigRowId("bdm-customers-001"),
          path: "rows/bdm-customers-001",
        },
        {
          id: ConfigRowId("bdm-order-lines-001"),
          path: "rows/bdm-order-lines-001",
        },
        {
          id: ConfigRowId("bdm-orders-001"),
          path: "rows/bdm-orders-001",
        },
        {
          id: ConfigRowId("bdm-product-margin-over-time-001"),
          path: "rows/bdm-product-margin-over-time-001",
        },
        {
          id: ConfigRowId("bdm-products-001"),
          path: "rows/bdm-products-001",
        },
        {
          id: ConfigRowId("bdm-rfm-001"),
          path: "rows/bdm-rfm-001",
        },
        {
          id: ConfigRowId("bdm-shipping-type-001"),
          path: "rows/bdm-shipping-type-001",
        },
        {
          id: ConfigRowId("out-shop-001"),
          path: "rows/out-shop-001",
        },
      ],
    },
  ],
}

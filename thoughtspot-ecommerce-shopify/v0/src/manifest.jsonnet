{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("thoughtspot-ecommerce-shopify-orchestration-10697799"),
  },
  configurations: std.filter(function(v) v != null,[
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("thoughtspot-ecommerce-shopify-orchestration-10697799"),
      path: "other/keboola.orchestrator/thoughtspot-ecommerce-shopify-orchestration-10697799",
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
      metadata: { "KBC.configuration.folderName": "[THOUGHTSPOT-ECOMMERCE-SHOPIFY]"}
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shopify-transformation2-data-preparation-10697799"),
      path: "<common>/in-ecommerce-shopify/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-shopify-transformation2-data-preparation-10697799",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[THOUGHTSPOT-ECOMMERCE-SHOPIFY]"}
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shopify-transformation3-rfm-analysis-10697799"),
      path: "<common>/in-ecommerce-shopify/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-shopify-transformation3-rfm-analysis-10697799",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[THOUGHTSPOT-ECOMMERCE-SHOPIFY]"}
    },
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("out-ecommerce-bigquery-writer-10697799"),
      path: "<common>/out-ecommerce-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/out-ecommerce-bigquery-writer-10697799",
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
    if InputIsAvailable("wr-snowflake-blob-storage-db-host") then
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
    if InputIsAvailable("ex-facebook-ads-api-version") then
    {
      componentId: "keboola.ex-facebook-ads",
      id: ConfigId("in-ecommerce-facebook-extractor-6031001"),
      path: "<common>/in-ecommerce-facebook/v0/src/extractor/keboola.ex-facebook-ads/in-ecommerce-facebook-extractor-6031001",
      rows: [],
    },
    if InputIsAvailable("ex-facebook-ads-api-version") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-facebook-transformation-6031001"),
      path: "<common>/in-ecommerce-facebook/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-facebook-transformation-6031001",
      rows: [],
    },
    if InputIsAvailable("ex-google-ads-customer-id") then
    {
      componentId: "keboola.ex-google-ads",
      id: ConfigId("in-ecommerce-googleads-extractor-15228151"),
      path: "<common>/in-ecommerce-googleads/v0/src/extractor/keboola.ex-google-ads/in-ecommerce-googleads-extractor-15228151",
      rows: [
        {
          id: ConfigRowId("campaign"),
          path: "rows/campaign",
        },
      ],
    },
    if InputIsAvailable("ex-google-ads-customer-id") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-googleads-transformation-15228151"),
      path: "<common>/in-ecommerce-googleads/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-googleads-transformation-15228151",
      rows: [],
    },
    if InputIsAvailable("ex-sklik-token") then
    {
      componentId: "keboola.ex-sklik",
      id: ConfigId("in-ecommerce-sklik-extractor-6031007"),
      path: "<common>/in-ecommerce-sklik/v0/src/extractor/keboola.ex-sklik/in-ecommerce-sklik-extractor-6031007",
      rows: [],
    },
    if InputIsAvailable("ex-sklik-token") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-sklik-transformation-6031007"),
      path: "<common>/in-ecommerce-sklik/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-sklik-transformation-6031007",
      rows: [],
    },
    if InputIsAvailable("wr-snowflake-blob-storage-db-host") then
      if InputIsAvailable("ex-sklik-token")|| InputIsAvailable("ex-google-ads-customer-id")||InputIsAvailable("ex-facebook-ads-api-version") then
        {
          componentId: "keboola.wr-snowflake-blob-storage",
          id: ConfigId("out-ecommerce-snowflake-marketing-writer-6031001"),
          path: "<common>/out-ecommerce-snowflake-marketing/v0/src/writer/keboola.wr-snowflake-blob-storage/out-ecommerce-snowflake-marketing-writer-6031001",
          rows: [
            {
              id: ConfigRowId("bdm-marketing-campaign-costs"),
              path: "rows/bdm-marketing-campaign-costs",
            },
            {
              id: ConfigRowId("bdm-marketing-campaign-costs-monthly"),
              path: "rows/bdm-marketing-campaign-costs-monthly",
            },
          ],
        },
    ],
  )
}

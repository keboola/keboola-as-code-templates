{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("keboola-ecommerce-shoptet-orchestration"),
  },
  configurations: std.filter(function(v) v != null,[
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("keboola-ecommerce-shoptet-orchestration"),
      path: "other/keboola.orchestrator/keboola-ecommerce-shoptet-orchestration",
      rows: [],
    },
    {
      componentId: "kds-team.ex-shoptet-permalink",
      id: ConfigId("in-ecommerce-shoptet-extractor"),
      path: "<common>/in-ecommerce-shoptet/v0/src/extractor/kds-team.ex-shoptet-permalink/in-ecommerce-shoptet-extractor",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shoptet-transformation1-data-preparation"),
      path: "<common>/in-ecommerce-shoptet/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-shoptet-transformation1-data-preparation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ECOMMERCE-SHOPTET]"}
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shoptet-transformation2-rfm-analysis"),
      path: "<common>/in-ecommerce-shoptet/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-shoptet-transformation2-rfm-analysis",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ECOMMERCE-SHOPTET]"}
    },
    if InputIsAvailable("wr-snowflake-blob-storage-db-host") then
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("out-ecommerce-snowflake-writer"),
      path: "<common>/out-ecommerce-snowflake/v0/src/writer/keboola.wr-snowflake-blob-storage/out-ecommerce-snowflake-writer",
      rows: std.filter(function(v) v != null,[
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
        if InputIsAvailable("ex-sklik-token")|| InputIsAvailable("oauth-googleads")||InputIsAvailable("oauth-facebookads") then
        {
          id: ConfigRowId("bdm-marketing-campaign-costs"),
          path: "rows/bdm-marketing-campaign-costs",
        },
        if InputIsAvailable("ex-sklik-token")|| InputIsAvailable("oauth-googleads")||InputIsAvailable("oauth-facebookads") then
        {
          id: ConfigRowId("bdm-marketing-campaign-costs-monthly"),
          path: "rows/bdm-marketing-campaign-costs-monthly",
        }
      ]),
    },
    if InputIsAvailable("oauth-facebookads") then
    {
      componentId: "keboola.ex-facebook-ads",
      id: ConfigId("in-ecommerce-facebook-extractor"),
      path: "<common>/in-ecommerce-facebook/v0/src/extractor/keboola.ex-facebook-ads/in-ecommerce-facebook-extractor",
      rows: [],
    },
    if InputIsAvailable("oauth-facebookads") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-facebook-transformation"),
      path: "<common>/in-ecommerce-facebook/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-facebook-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ECOMMERCE-SHOPTET]"}
    },
    if InputIsAvailable("oauth-googleads") then
    {
      componentId: "keboola.ex-google-ads",
      id: ConfigId("in-ecommerce-googleads-extractor"),
      path: "<common>/in-ecommerce-googleads/v0/src/extractor/keboola.ex-google-ads/in-ecommerce-googleads-extractor",
      rows: [
        {
          id: ConfigRowId("campaign"),
          path: "rows/campaign",
        },
      ],
    },
    if InputIsAvailable("oauth-googleads") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-googleads-transformation"),
      path: "<common>/in-ecommerce-googleads/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-googleads-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ECOMMERCE-SHOPTET]"}
    },
    if InputIsAvailable("ex-sklik-token") then
    {
      componentId: "keboola.ex-sklik",
      id: ConfigId("in-ecommerce-sklik-extractor"),
      path: "<common>/in-ecommerce-sklik/v0/src/extractor/keboola.ex-sklik/in-ecommerce-sklik-extractor",
      rows: [],
    },
    if InputIsAvailable("ex-sklik-token") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-sklik-transformation"),
      path: "<common>/in-ecommerce-sklik/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-sklik-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ECOMMERCE-SHOPTET]"}
    },
  ],)
}

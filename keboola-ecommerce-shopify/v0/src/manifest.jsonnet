{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("keboola-ecommerce-shopify-orchestration"),
  },
  configurations: std.filter(function(v) v != null,[
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("keboola-ecommerce-shopify-orchestration"),
      path: "other/keboola.orchestrator/keboola-ecommerce-shopify-orchestration",
      rows: [],
    },
    {
      componentId: "kds-team.ex-shopify",
      id: ConfigId("in-ecommerce-shopify-extractor"),
      path: "<common>/in-ecommerce-shopify/v0/src/extractor/kds-team.ex-shopify/in-ecommerce-shopify-extractor",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shopify-transformation1-prepare-input-tables"),
      path: "<common>/in-ecommerce-shopify/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-shopify-transformation1-prepare-input-tables",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ECOMMERCE-SHOPIFY]"}
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shopify-transformation2-data-preparation"),
      path: "<common>/in-ecommerce-shopify/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-shopify-transformation2-data-preparation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ECOMMERCE-SHOPIFY]"}
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-shopify-transformation3-rfm-analysis"),
      path: "<common>/in-ecommerce-shopify/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-shopify-transformation3-rfm-analysis",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ECOMMERCE-SHOPIFY]"}
    },
    if InputIsAvailable("google-sheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("out-ecommerce-gsheet-writer"),
      path: "<common>/out-ecommerce-gsheet/v0/src/writer/keboola.wr-google-sheets/out-ecommerce-gsheet-writer",
      rows: [],
    },
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("out-ecommerce-bigquery-writer"),
      path: "<common>/out-ecommerce-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/out-ecommerce-bigquery-writer",
      rows: std.filter(function(v) v != null,[
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
    if InputIsAvailable("wr-snowflake-db-host") then
    {
      componentId: SnowflakeWriterComponentId(),
      id: ConfigId("out-ecommerce-snowflake-writer"),
      path: "<common>/out-ecommerce-snowflake/v0/src/writer/keboola.wr-snowflake/out-ecommerce-snowflake-writer",
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
      metadata: { "KBC.configuration.folderName": "[ECOMMERCE-SHOPIFY]"}
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
      metadata: { "KBC.configuration.folderName": "[ECOMMERCE-SHOPIFY]"}
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
      metadata: { "KBC.configuration.folderName": "[ECOMMERCE-SHOPIFY]"}
    },
    if InputIsAvailable("data-studio-gsheet-id") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("gsheet-datastudio-transformation"),
      path: "<common>/out-ecommerce-gsheet-datastudio/v0/src/transformation/keboola.snowflake-transformation/gsheet-datastudio-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ECOMMERCE-SHOPIFY]"}
    },
    if InputIsAvailable("data-studio-gsheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("gsheet-datastudio"),
      path: "<common>/out-ecommerce-gsheet-datastudio/v0/src/writer/keboola.wr-google-sheets/gsheet-datastudio",
      rows: []
    },
    if InputIsAvailable("wr-postgresql-db-hostname") then
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("out-ecommerce-postgresql-writer"),
      path: "<common>/out-ecommerce-postgresql/v0/src/writer/keboola.wr-db-pgsql/out-ecommerce-postgresql-writer",
      rows: std.filter(function(v) v != null,[
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
        if InputIsAvailable("ex-sklik-token")|| InputIsAvailable("oauth-googleads")||InputIsAvailable("oauth-facebookads") then
        {
          id: ConfigRowId("bdm-marketing-campaign-costs"),
          path: "rows/bdm-marketing-campaign-costs",
        },
        if InputIsAvailable("ex-sklik-token")|| InputIsAvailable("oauth-googleads")||InputIsAvailable("oauth-facebookads") then
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
      ],)
    }
  ]
  )
}

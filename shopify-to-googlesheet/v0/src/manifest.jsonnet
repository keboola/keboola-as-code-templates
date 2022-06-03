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
    if InputIsAvailable("ex-facebook-ads-api-version") then
    {
      componentId: "keboola.ex-facebook-ads",
      id: ConfigId("in-ecommerce-facebook-extractor"),
      path: "<common>/in-ecommerce-facebook/v0/src/extractor/keboola.ex-facebook-ads/in-ecommerce-facebook-extractor",
      rows: [],
    },
    if InputIsAvailable("ex-facebook-ads-api-version") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-ecommerce-facebook-transformation"),
      path: "<common>/in-ecommerce-facebook/v0/src/transformation/keboola.snowflake-transformation/in-ecommerce-facebook-transformation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[ECOMMERCE-SHOPIFY]"}
    },
    if InputIsAvailable("ex-google-ads-customer-id") then
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
    if InputIsAvailable("ex-google-ads-customer-id") then
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
    ],
  )
}

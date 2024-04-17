{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-ecommerce-for-new-template"),
  },
  configurations: std.filter(function(v) v != null,[
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("flow-ecommerce-for-new-template"),
      path: "other/keboola.orchestrator/flow-ecommerce-for-new-template",
      rows: [],
    },
    if InputIsAvailable("ex-bigcommerce-access-token") then
    {
      componentId: "kds-team.ex-bigcommerce",
      id: ConfigId("data-source-in-ecommerce-bigcommerce"),
      path: "<common>/in-ecommerce-bigcommerce/v0/src/extractor/kds-team.ex-bigcommerce/data-source-in-ecommerce-bigcommerce",
      rows: [
        {
          id: ConfigRowId("brands"),
          path: "rows/brands",
        },
        {
          id: ConfigRowId("customers"),
          path: "rows/customers",
        },
        {
          id: ConfigRowId("orders"),
          path: "rows/orders",
        },
        {
          id: ConfigRowId("products"),
          path: "rows/products",
        },
      ],
    },
    if InputIsAvailable("ex-shopify-api-token") then
    {
      componentId: "kds-team.ex-shopify",
      id: ConfigId("data-source-in-ecommerce-shopify"),
      path: "<common>/in-ecommerce-shopify/v1/src/extractor/kds-team.ex-shopify/data-source-in-ecommerce-shopify",
      rows: [],
    },
    if InputIsAvailable("ex-woocommerce-store-url") then
    {
      componentId: "kds-team.ex-woocommerce",
      id: ConfigId("data-source-in-ecommerce-woocommerce"),
      path: "<common>/in-ecommerce-woocommerce/v0/src/extractor/kds-team.ex-woocommerce/data-source-in-ecommerce-woocommerce",
      rows: [],
    },
    if InputIsAvailable("ex-shopify-api-token") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-1-prepare-input-tables-in-ecommerce-shopify"),
      path: "<common>/in-ecommerce-shopify/v1/src/transformation/keboola.snowflake-transformation/transformation-1-prepare-input-tables-in-ecommerce-shopify",
      metadata: {
        "KBC.configuration.folderName": "ECOMMERCE",
      },
      rows: [],
    },
    if InputIsAvailable("ex-shopify-api-token") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-2-data-preparation-in-ecommerce-shopify"),
      path: "<common>/in-ecommerce-shopify/v1/src/transformation/keboola.snowflake-transformation/transformation-2-data-preparation-in-ecommerce-shopify",
      metadata: {
        "KBC.configuration.folderName": "ECOMMERCE",
      },
      rows: [],
    },
    if InputIsAvailable("ex-bigcommerce-access-token") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-in-ecommerce-bigcommerce"),
      path: "<common>/in-ecommerce-bigcommerce/v0/src/transformation/keboola.snowflake-transformation/transformation-in-ecommerce-bigcommerce",
      metadata: {
        "KBC.configuration.folderName": "ECOMMERCE",
      },
      rows: [],
    },
    if InputIsAvailable("ex-woocommerce-store-url") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-in-ecommerce-woocommerce"),
      path: "<common>/in-ecommerce-woocommerce/v0/src/transformation/keboola.snowflake-transformation/transformation-in-ecommerce-woocommerce",
      metadata: {
        "KBC.configuration.folderName": "ECOMMERCE",
      },
      rows: [],
    },
    if InputIsAvailable("wr-postgresql-db-hostname") then
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("data-destination-out-ecommerce-postgresql"),
      path: "<common>/out-ecommerce-postgresql/v1/src/writer/keboola.wr-db-pgsql/data-destination-out-ecommerce-postgresql",
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
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-ecommerce-bigquery"),
      path: "<common>/out-ecommerce-bigquery/v1/src/writer/keboola.wr-google-bigquery-v2/data-destination-out-ecommerce-bigquery",
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
    if InputIsAvailable("google-sheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("data-destination-out-ecommerce-gsheet"),
      path: "<common>/out-ecommerce-gsheet/v1/src/writer/keboola.wr-google-sheets/data-destination-out-ecommerce-gsheet",
      rows: [],
    },
    if InputIsAvailable("wr-snowflake-db-host") then
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("data-destination-out-ecommerce-snowflake"),
      path: "<common>/out-ecommerce-snowflake/v1/src/writer/keboola.wr-snowflake-blob-storage/data-destination-out-ecommerce-snowflake",
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
  ],)
}

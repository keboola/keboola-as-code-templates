{
  configurations: [
    {
      componentId: "keboola.data-apps",
      id: ConfigId("interactive-data-app"),
      path: "app/keboola.data-apps/interactive-data-app",
      rows: [],
    },
    {
      componentId: "keboola.ex-sample-data",
      id: ConfigId("import-shopify-demo-data"),
      path: "extractor/keboola.ex-sample-data/import-shopify-demo-data",
      metadata: {
        "KBC.KAC.templates.configId": '{"idInTemplate":"in-ecommerce-shopify-extractor"}',
        "KBC.KAC.templates.instanceId": "JPblfJtgey8xVKAvheJXtRq0o",
        "KBC.KAC.templates.repository": "keboola-dev",
        "KBC.KAC.templates.templateId": "[ECOMMERCE-SHOPIFY]",
      },
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("RFM-shopify-streamlit"),
      path: "other/keboola.orchestrator/RFM-shopify-streamlit",
      metadata: {
        "KBC.KAC.templates.configId": '{"idInTemplate":"keboola-ecommerce-shopify-orchestration"}',
        "KBC.KAC.templates.instanceId": "JPblfJtgey8xVKAvheJXtRq0o",
        "KBC.KAC.templates.repository": "keboola-dev",
        "KBC.KAC.templates.templateId": "[ECOMMERCE-SHOPIFY]",
      },
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("data-preparation"),
      path: "transformation/keboola.snowflake-transformation/data-preparation-cleaning",
      metadata: {
        "KBC.KAC.templates.configId": '{"idInTemplate":"in-ecommerce-shopify-transformation2-data-preparation-cleaning"}',
        "KBC.KAC.templates.instanceId": "JPblfJtgey8xVKAvheJXtRq0o",
        "KBC.KAC.templates.repository": "keboola-dev",
        "KBC.KAC.templates.templateId": "snowflake-virtual-hands-on-lab-streamlit",
        "KBC.configuration.folderName": "[ECOMMERCE-SHOPIFY]",
      },
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("RFM-analysis"),
      path: "transformation/keboola.snowflake-transformation/RFM-analysis",
      
      metadata: { 
        "KBC.KAC.templates.configId": '{"idInTemplate":"in-ecommerce-shopify-transformation3-RFM-analysis"}',
        "KBC.KAC.templates.instanceId": "JPblfJtgey8xVKAvheJXtRq0o",
        "KBC.KAC.templates.repository": "keboola-dev",
        "KBC.KAC.templates.templateId": "snowflake-virtual-hands-on-lab-streamlit",
        "KBC.configuration.folderName": "[ECOMMERCE-SHOPIFY]"
      },
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("prepare-input-tables"),
      path: "transformation/keboola.snowflake-transformation/prepare-input-tables",
      metadata: {
        "KBC.KAC.templates.configId": '{"idInTemplate":"in-ecommerce-shopify-transformation1-prepare-input-tables"}',
        "KBC.KAC.templates.instanceId": "JPblfJtgey8xVKAvheJXtRq0o",
        "KBC.KAC.templates.repository": "keboola-dev",
        "KBC.KAC.templates.templateId": "snowflake-virtual-hands-on-lab-streamlit",
        "KBC.configuration.folderName": "[ECOMMERCE-SHOPIFY]",
      },
      rows: [],
    },
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("create-snowflake-scheme"),
      path: "writer/keboola.wr-snowflake-blob-storage/create-snowflake-scheme",
      metadata: {
        "KBC.KAC.templates.configId": '{"idInTemplate":"out-ecommerce-snowflake-writer"}',
        "KBC.KAC.templates.configInputs": '[{"input":"wr-snowflake-db-password","key":"parameters.db.#password"},{"input":"wr-snowflake-db-database","key":"parameters.db.database"},{"input":"wr-snowflake-db-host","key":"parameters.db.host"},{"input":"wr-snowflake-db-port","key":"parameters.db.port"},{"input":"wr-snowflake-db-schema","key":"parameters.db.schema"},{"input":"wr-snowflake-db-user","key":"parameters.db.user"},{"input":"wr-snowflake-db-warehouse","key":"parameters.db.warehouse"}]',
        "KBC.KAC.templates.instanceId": "JPblfJtgey8xVKAvheJXtRq0o",
        "KBC.KAC.templates.repository": "keboola-dev",
        "KBC.KAC.templates.rowsIds": '[{"idInProject":"49036255","idInTemplate":"bdm-analyze-clv-by-order-count-001"},{"idInProject":"49036260","idInTemplate":"bdm-analyze-clv-by-time-from-previous-order-001"},{"idInProject":"49036267","idInTemplate":"bdm-billing-type-001"},{"idInProject":"49036268","idInTemplate":"bdm-customers-001"},{"idInProject":"49036282","idInTemplate":"bdm-marketing-campaign-costs"},{"idInProject":"49036283","idInTemplate":"bdm-marketing-campaign-costs-monthly"},{"idInProject":"49036269","idInTemplate":"bdm-order-lines-001"},{"idInProject":"49036270","idInTemplate":"bdm-orders-001"},{"idInProject":"49036272","idInTemplate":"bdm-product-margin-over-time-001"},{"idInProject":"49036273","idInTemplate":"bdm-products-001"},{"idInProject":"49036276","idInTemplate":"bdm-rfm-001"},{"idInProject":"49036280","idInTemplate":"bdm-shipping-type-001"},{"idInProject":"' + ConfigRowId("out-shop") + '","idInTemplate":"out-shop-001"}]',
        "KBC.KAC.templates.templateId": "snowflake-virtual-hands-on-lab-streamlit",
      },
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
  ],
}

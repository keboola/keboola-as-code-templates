{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + ConfigId("out-ecommerce-bigquery-writer-10697799") + ".bdm_products",
          destination: "out.c-ecommerce-wr-" + ConfigId("out-ecommerce-bigquery-writer-10697799") + ".bdm_products.csv",
          changed_since: "",
          columns: [
            "PRODUCT_ID",
            "PRODUCT_CODE",
            "PRODUCT_CODE_2",
            "PRODUCT_GUID",
            "PRODUCT_NAME",
            "PRODUCT_MANUFACTURER",
            "PRODUCT_TYPE",
            "PRODUCT_EAN",
            "PRODUCT_PRICE",
            "PRODUCT_STANDARD_PRICE",
            "PRODUCT_PURCHASE_PRICE",
            "PRODUCT_OPTION1",
            "PRODUCT_OPTION2",
            "PRODUCT_OPTION3",
            "PRODUCT_STOCK_AMOUNT",
            "CATEGORY",
            "CATEGORY_TEXT",
            "PRODUCT_URL",
            "IS_DELETED",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "bdm_products",
        tableId: "out.c-ecommerce-wr-" + ConfigId("out-ecommerce-bigquery-writer-10697799") + ".bdm_products",
        incremental: false,
        items: [
          {
            name: "PRODUCT_ID",
            dbName: "PRODUCT_ID",
            type: "STRING",
          },
          {
            name: "PRODUCT_CODE",
            dbName: "PRODUCT_CODE",
            type: "STRING",
          },
          {
            name: "PRODUCT_CODE_2",
            dbName: "PRODUCT_CODE_2",
            type: "STRING",
          },
          {
            name: "PRODUCT_GUID",
            dbName: "PRODUCT_GUID",
            type: "STRING",
          },
          {
            name: "PRODUCT_NAME",
            dbName: "PRODUCT_NAME",
            type: "STRING",
          },
          {
            name: "PRODUCT_MANUFACTURER",
            dbName: "PRODUCT_MANUFACTURER",
            type: "STRING",
          },
          {
            name: "PRODUCT_TYPE",
            dbName: "PRODUCT_TYPE",
            type: "STRING",
          },
          {
            name: "PRODUCT_EAN",
            dbName: "PRODUCT_EAN",
            type: "STRING",
          },
          {
            name: "PRODUCT_PRICE",
            dbName: "PRODUCT_PRICE",
            type: "FLOAT",
          },
          {
            name: "PRODUCT_STANDARD_PRICE",
            dbName: "PRODUCT_STANDARD_PRICE",
            type: "STRING",
          },
          {
            name: "PRODUCT_PURCHASE_PRICE",
            dbName: "PRODUCT_PURCHASE_PRICE",
            type: "STRING",
          },
          {
            name: "PRODUCT_OPTION1",
            dbName: "PRODUCT_OPTION1",
            type: "STRING",
          },
          {
            name: "PRODUCT_OPTION2",
            dbName: "PRODUCT_OPTION2",
            type: "STRING",
          },
          {
            name: "PRODUCT_OPTION3",
            dbName: "PRODUCT_OPTION3",
            type: "STRING",
          },
          {
            name: "PRODUCT_STOCK_AMOUNT",
            dbName: "PRODUCT_STOCK_AMOUNT",
            type: "STRING",
          },
          {
            name: "CATEGORY",
            dbName: "CATEGORY",
            type: "STRING",
          },
          {
            name: "CATEGORY_TEXT",
            dbName: "CATEGORY_TEXT",
            type: "STRING",
          },
          {
            name: "PRODUCT_URL",
            dbName: "PRODUCT_URL",
            type: "STRING",
          },
          {
            name: "IS_DELETED",
            dbName: "IS_DELETED",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

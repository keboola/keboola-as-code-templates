{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_products",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_products.csv",
          changed_since: "",
          columns: [
            "PRODUCT_ID",
            "PRODUCT_CODE",
            "PRODUCT_NAME",
            "PRODUCT_MANUFACTURER",
            "PRODUCT_TYPE",
            "PRODUCT_EAN",
            "PRODUCT_PRICE",
            "PRODUCT_STANDARD_PRICE",
            "PRODUCT_PURCHASE_PRICE",
            "PRODUCT_STOCK_AMOUNT",
            "PRODUCT_URL",
            "TOTAL_UNITS_SOLD",
            "UNITS_SOLD_LAST_MONTH",
            "AVG_SOLD_UNITS_PER_DAY",
            "STOCK_REFILL",
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
        tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_products",
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
            type: "INTEGER",
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
            type: "FLOAT",
          },
          {
            name: "PRODUCT_PURCHASE_PRICE",
            dbName: "PRODUCT_PURCHASE_PRICE",
            type: "FLOAT",
          },
          {
            name: "PRODUCT_STOCK_AMOUNT",
            dbName: "PRODUCT_STOCK_AMOUNT",
            type: "FLOAT",
          },
          {
            name: "PRODUCT_URL",
            dbName: "PRODUCT_URL",
            type: "STRING",
          },
          {
            name: "TOTAL_UNITS_SOLD",
            dbName: "TOTAL_UNITS_SOLD",
            type: "FLOAT",
          },
          {
            name: "UNITS_SOLD_LAST_MONTH",
            dbName: "UNITS_SOLD_LAST_MONTH",
            type: "FLOAT",
          },
          {
            name: "AVG_SOLD_UNITS_PER_DAY",
            dbName: "AVG_SOLD_UNITS_PER_DAY",
            type: "FLOAT",
          },
          {
            name: "STOCK_REFILL",
            dbName: "STOCK_REFILL",
            type: "FLOAT",
          },
          {
            name: "IS_DELETED",
            dbName: "IS_DELETED",
            type: "BOOLEAN",
          },
        ],
      },
    ],
  },
}

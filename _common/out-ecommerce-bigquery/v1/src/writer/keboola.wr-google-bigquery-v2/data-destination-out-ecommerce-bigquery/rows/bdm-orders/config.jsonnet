{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_orders",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_orders.csv",
          changed_since: "",
          columns: [
            "ORDER_ID",
            "ORDER_DATE",
            "ORDER_STATUS",
            "IS_SUCCESSFUL",
            "IS_FIRST_PURCHASE",
            "ORDER_CURRENCY",
            "ORDER_CUSTOMER_EMAIL",
            "ORDER_REMARK",
            "REFERER",
            "CHANNEL",
            "SOURCE",
            "BILLING_CITY",
            "BILLING_COUNTRY",
            "BILLING_ZIP",
            "SHIPPING_CITY",
            "SHIPPING_COUNTRY",
            "SHIPPING_ZIP",
            "BILLING_TYPE",
            "SHIPPING_TYPE",
            "ORDER_TOTAL_PRICE_WITH_TAXES",
            "ORDER_TOTAL_PRICE_WITHOUT_TAXES",
            "ORDER_TOTAL_PRICE_TAXES",
            "CUSTOMER_ID",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "bdm_orders",
        tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_orders",
        incremental: false,
        items: [
          {
            name: "ORDER_ID",
            dbName: "ORDER_ID",
            type: "STRING",
          },
          {
            name: "ORDER_DATE",
            dbName: "ORDER_DATE",
            type: "DATE",
          },
          {
            name: "ORDER_STATUS",
            dbName: "ORDER_STATUS",
            type: "STRING",
          },
          {
            name: "IS_SUCCESSFUL",
            dbName: "IS_SUCCESSFUL",
            type: "BOOLEAN",
          },
          {
            name: "IS_FIRST_PURCHASE",
            dbName: "IS_FIRST_PURCHASE",
            type: "BOOLEAN",
          },
          {
            name: "ORDER_CURRENCY",
            dbName: "ORDER_CURRENCY",
            type: "STRING",
          },
          {
            name: "ORDER_CUSTOMER_EMAIL",
            dbName: "ORDER_CUSTOMER_EMAIL",
            type: "STRING",
          },
          {
            name: "ORDER_REMARK",
            dbName: "ORDER_REMARK",
            type: "STRING",
          },
          {
            name: "REFERER",
            dbName: "REFERER",
            type: "STRING",
          },
          {
            name: "CHANNEL",
            dbName: "CHANNEL",
            type: "STRING",
          },
          {
            name: "SOURCE",
            dbName: "SOURCE",
            type: "STRING",
          },
          {
            name: "BILLING_CITY",
            dbName: "BILLING_CITY",
            type: "STRING",
          },
          {
            name: "BILLING_COUNTRY",
            dbName: "BILLING_COUNTRY",
            type: "STRING",
          },
          {
            name: "BILLING_ZIP",
            dbName: "BILLING_ZIP",
            type: "STRING",
          },
          {
            name: "SHIPPING_CITY",
            dbName: "SHIPPING_CITY",
            type: "STRING",
          },
          {
            name: "SHIPPING_COUNTRY",
            dbName: "SHIPPING_COUNTRY",
            type: "STRING",
          },
          {
            name: "SHIPPING_ZIP",
            dbName: "SHIPPING_ZIP",
            type: "STRING",
          },
          {
            name: "BILLING_TYPE",
            dbName: "BILLING_TYPE",
            type: "STRING",
          },
          {
            name: "SHIPPING_TYPE",
            dbName: "SHIPPING_TYPE",
            type: "STRING",
          },
          {
            name: "ORDER_TOTAL_PRICE_WITH_TAXES",
            dbName: "ORDER_TOTAL_PRICE_WITH_TAXES",
            type: "FLOAT",
          },
          {
            name: "ORDER_TOTAL_PRICE_WITHOUT_TAXES",
            dbName: "ORDER_TOTAL_PRICE_WITHOUT_TAXES",
            type: "FLOAT",
          },
          {
            name: "ORDER_TOTAL_PRICE_TAXES",
            dbName: "ORDER_TOTAL_PRICE_TAXES",
            type: "FLOAT",
          },
          {
            name: "CUSTOMER_ID",
            dbName: "CUSTOMER_ID",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

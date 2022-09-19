{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_customers",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_customers.csv",
          changed_since: "",
          columns: [
            "CUSTOMER_ID",
            "CUSTOMER_EMAIL_HASH",
            "CUSTOMER_EMAIL",
            "CUSTOMER_ACCOUNT_GUID",
            "CUSTOMER_BILLING_CITY",
            "CUSTOMER_BILLING_COUNTRY",
            "CUSTOMER_SHIPPING_CITY",
            "CUSTOMER_SHIPPING_COUNTRY",
            "CUSTOMER_PRICE_LIST",
            "CUSTOMER_GROUP",
            "ACCEPTS_MARKETING",
            "MARKETING_OPT_IN_LEVEL",
            "ORDERS_COUNT",
            "TOTAL_SPEND",
            "VERIFIED_EMAIL",
            "STATE",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "bdm_customers",
        tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_customers",
        incremental: false,
        items: [
          {
            name: "CUSTOMER_ID",
            dbName: "CUSTOMER_ID",
            type: "STRING",
          },
          {
            name: "CUSTOMER_EMAIL_HASH",
            dbName: "CUSTOMER_EMAIL_HASH",
            type: "STRING",
          },
          {
            name: "CUSTOMER_EMAIL",
            dbName: "CUSTOMER_EMAIL",
            type: "STRING",
          },
          {
            name: "CUSTOMER_ACCOUNT_GUID",
            dbName: "CUSTOMER_ACCOUNT_GUID",
            type: "STRING",
          },
          {
            name: "CUSTOMER_BILLING_CITY",
            dbName: "CUSTOMER_BILLING_CITY",
            type: "STRING",
          },
          {
            name: "CUSTOMER_BILLING_COUNTRY",
            dbName: "CUSTOMER_BILLING_COUNTRY",
            type: "STRING",
          },
          {
            name: "CUSTOMER_SHIPPING_CITY",
            dbName: "CUSTOMER_SHIPPING_CITY",
            type: "STRING",
          },
          {
            name: "CUSTOMER_SHIPPING_COUNTRY",
            dbName: "CUSTOMER_SHIPPING_COUNTRY",
            type: "STRING",
          },
          {
            name: "CUSTOMER_PRICE_LIST",
            dbName: "CUSTOMER_PRICE_LIST",
            type: "STRING",
          },
          {
            name: "CUSTOMER_GROUP",
            dbName: "CUSTOMER_GROUP",
            type: "STRING",
          },
          {
            name: "ACCEPTS_MARKETING",
            dbName: "ACCEPTS_MARKETING",
            type: "BOOLEAN",
          },
          {
            name: "MARKETING_OPT_IN_LEVEL",
            dbName: "MARKETING_OPT_IN_LEVEL",
            type: "STRING",
          },
          {
            name: "ORDERS_COUNT",
            dbName: "ORDERS_COUNT",
            type: "FLOAT",
          },
          {
            name: "TOTAL_SPEND",
            dbName: "TOTAL_SPEND",
            type: "FLOAT",
          },
          {
            name: "VERIFIED_EMAIL",
            dbName: "VERIFIED_EMAIL",
            type: "BOOLEAN",
          },
          {
            name: "STATE",
            dbName: "STATE",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

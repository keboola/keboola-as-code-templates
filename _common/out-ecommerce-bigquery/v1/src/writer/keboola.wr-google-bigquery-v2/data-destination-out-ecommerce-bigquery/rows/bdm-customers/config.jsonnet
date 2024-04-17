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
            "CUSTOMER_BILLING_CITY",
            "CUSTOMER_BILLING_COUNTRY",
            "CUSTOMER_SHIPPING_CITY",
            "CUSTOMER_SHIPPING_COUNTRY",
            "ORDERS_COUNT_TOTAL",
            "TOTAL_SPEND",
            "AVG_ORDER_VALUE",
            "RECENCY_SCORE",
            "DAYS_SINCE_LAST_ORDER",
            "FREQUENCY_SCORE",
            "ORDERS_COUNT_RFM",
            "MONETARY_SCORE",
            "SUM_REVENUE",
            "FINAL_SCORE",
            "SEGMENT",
            "SEGMENT_NR",
            "FIRST_SUCCEEDED_TRANSACTION_DATE",
            "LAST_SUCCEEDED_TRANSACTION_DATE",
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
            name: "ORDERS_COUNT_TOTAL",
            dbName: "ORDERS_COUNT_TOTAL",
            type: "FLOAT",
          },
          {
            name: "TOTAL_SPEND",
            dbName: "TOTAL_SPEND",
            type: "FLOAT",
          },
          {
            name: "AVG_ORDER_VALUE",
            dbName: "AVG_ORDER_VALUE",
            type: "FLOAT",
          },
          {
            name: "RECENCY_SCORE",
            dbName: "RECENCY_SCORE",
            type: "INTEGER",
          },
          {
            name: "DAYS_SINCE_LAST_ORDER",
            dbName: "DAYS_SINCE_LAST_ORDER",
            type: "INTEGER",
          },
          {
            name: "FREQUENCY_SCORE",
            dbName: "FREQUENCY_SCORE",
            type: "INTEGER",
          },
          {
            name: "ORDERS_COUNT_RFM",
            dbName: "ORDERS_COUNT_RFM",
            type: "INTEGER",
          },
          {
            name: "MONETARY_SCORE",
            dbName: "MONETARY_SCORE",
            type: "INTEGER",
          },
          {
            name: "SUM_REVENUE",
            dbName: "SUM_REVENUE",
            type: "FLOAT",
          },
          {
            name: "FINAL_SCORE",
            dbName: "FINAL_SCORE",
            type: "INTEGER",
          },
          {
            name: "SEGMENT",
            dbName: "SEGMENT",
            type: "STRING",
          },
          {
            name: "SEGMENT_NR",
            dbName: "SEGMENT_NR",
            type: "INTEGER",
          },
          {
            name: "FIRST_SUCCEEDED_TRANSACTION_DATE",
            dbName: "FIRST_SUCCEEDED_TRANSACTION_DATE",
            type: "DATE",
          },
          {
            name: "LAST_SUCCEEDED_TRANSACTION_DATE",
            dbName: "LAST_SUCCEEDED_TRANSACTION_DATE",
            type: "DATE",
          },
        ],
      },
    ],
  },
}

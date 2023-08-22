{
  parameters: {
    dbName: "bdm_customers",
    incremental: false,
    items: [
      {
        dbName: "CUSTOMER_ID",
        default: "",
        name: "CUSTOMER_ID",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "CUSTOMER_EMAIL_HASH",
        default: "",
        name: "CUSTOMER_EMAIL_HASH",
        nullable: true,
        size: "128",
        type: "varchar",
      },
      {
        dbName: "CUSTOMER_EMAIL",
        default: "",
        name: "CUSTOMER_EMAIL",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "CUSTOMER_ACCOUNT_GUID",
        default: "",
        name: "CUSTOMER_ACCOUNT_GUID",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "CUSTOMER_BILLING_CITY",
        default: "",
        name: "CUSTOMER_BILLING_CITY",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "CUSTOMER_BILLING_COUNTRY",
        default: "",
        name: "CUSTOMER_BILLING_COUNTRY",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "CUSTOMER_SHIPPING_CITY",
        default: "",
        name: "CUSTOMER_SHIPPING_CITY",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "CUSTOMER_SHIPPING_COUNTRY",
        default: "",
        name: "CUSTOMER_SHIPPING_COUNTRY",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "CUSTOMER_PRICE_LIST",
        default: "",
        name: "CUSTOMER_PRICE_LIST",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "CUSTOMER_GROUP",
        default: "",
        name: "CUSTOMER_GROUP",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "ACCEPTS_MARKETING",
        default: "",
        name: "ACCEPTS_MARKETING",
        nullable: true,
        size: "",
        type: "boolean",
      },
      {
        dbName: "MARKETING_OPT_IN_LEVEL",
        default: "",
        name: "MARKETING_OPT_IN_LEVEL",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "ORDERS_COUNT",
        default: "",
        name: "ORDERS_COUNT",
        nullable: true,
        size: "38,0",
        type: "number",
      },
      {
        dbName: "TOTAL_SPEND",
        default: "",
        name: "TOTAL_SPEND",
        nullable: true,
        size: "",
        type: "double",
      },
      {
        dbName: "VERIFIED_EMAIL",
        default: "",
        name: "VERIFIED_EMAIL",
        nullable: true,
        size: "",
        type: "boolean",
      },
      {
        dbName: "STATE",
        default: "",
        name: "STATE",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
    ],
    primaryKey: [
      "CUSTOMER_ACCOUNT_GUID",
    ],
    tableId: "out.c-ecommerce-wr-JPblfJtg.bdm_customers",
  },
  storage: {
    input: {
      tables: [
        {
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
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_customers.csv",
          source: "out.c-ecommerce-wr-JPblfJtg.bdm_customers",
        },
      ],
    },
  },
}
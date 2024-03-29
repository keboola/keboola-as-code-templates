{
  parameters: {
    tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_customers",
    dbName: "bdm_customers",
    incremental: false,
    primaryKey: [
      "CUSTOMER_ACCOUNT_GUID",
    ],
    items: [
      {
        name: "CUSTOMER_ID",
        dbName: "CUSTOMER_ID",
        type: "varchar",
        nullable: true,
        default: "",
        size: "10485760",
      },
      {
        name: "CUSTOMER_EMAIL_HASH",
        dbName: "CUSTOMER_EMAIL_HASH",
        type: "varchar",
        nullable: true,
        default: "",
        size: "128",
      },
      {
        name: "CUSTOMER_EMAIL",
        dbName: "CUSTOMER_EMAIL",
        type: "varchar",
        nullable: true,
        default: "",
        size: "10485760",
      },
      {
        name: "CUSTOMER_ACCOUNT_GUID",
        dbName: "CUSTOMER_ACCOUNT_GUID",
        type: "varchar",
        nullable: true,
        default: "",
        size: "10485760",
      },
      {
        name: "CUSTOMER_BILLING_CITY",
        dbName: "CUSTOMER_BILLING_CITY",
        type: "varchar",
        nullable: true,
        default: "",
        size: "10485760",
      },
      {
        name: "CUSTOMER_BILLING_COUNTRY",
        dbName: "CUSTOMER_BILLING_COUNTRY",
        type: "varchar",
        nullable: true,
        default: "",
        size: "10485760",
      },
      {
        name: "CUSTOMER_SHIPPING_CITY",
        dbName: "CUSTOMER_SHIPPING_CITY",
        type: "varchar",
        nullable: true,
        default: "",
        size: "10485760",
      },
      {
        name: "CUSTOMER_SHIPPING_COUNTRY",
        dbName: "CUSTOMER_SHIPPING_COUNTRY",
        type: "varchar",
        nullable: true,
        default: "",
        size: "10485760",
      },
      {
        name: "CUSTOMER_PRICE_LIST",
        dbName: "CUSTOMER_PRICE_LIST",
        type: "varchar",
        nullable: true,
        default: "",
        size: "10485760",
      },
      {
        name: "CUSTOMER_GROUP",
        dbName: "CUSTOMER_GROUP",
        type: "varchar",
        nullable: true,
        default: "",
        size: "10485760",
      },
      {
        name: "ACCEPTS_MARKETING",
        dbName: "ACCEPTS_MARKETING",
        type: "boolean",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "MARKETING_OPT_IN_LEVEL",
        dbName: "MARKETING_OPT_IN_LEVEL",
        type: "varchar",
        nullable: true,
        default: "",
        size: "10485760",
      },
      {
        name: "ORDERS_COUNT",
        dbName: "ORDERS_COUNT",
        type: "numeric",
        nullable: true,
        default: "",
        size: "18,0",
      },
      {
        name: "TOTAL_SPEND",
        dbName: "TOTAL_SPEND",
        type: "double precision",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "VERIFIED_EMAIL",
        dbName: "VERIFIED_EMAIL",
        type: "boolean",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "STATE",
        dbName: "STATE",
        type: "varchar",
        nullable: true,
        default: "",
        size: "10485760",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_customers",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_customers.csv",
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
          changed_since: "",
        },
      ],
    },
  },
}

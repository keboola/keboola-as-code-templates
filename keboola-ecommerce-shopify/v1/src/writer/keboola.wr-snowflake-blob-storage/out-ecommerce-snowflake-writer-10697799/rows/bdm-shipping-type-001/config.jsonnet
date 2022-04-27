{
  parameters: {
    tableId: "out.c-ecommerce-bdm-"+ConfigId("in-ecommerce-shopify-extractor-10697799")+".bdm_shipping_type",
    dbName: "bdm_shipping_type",
    incremental: false,
    primaryKey: [
      "SHIPPING_TYPE_ID",
    ],
    items: [
      {
        name: "SHIPPING_TYPE_ID",
        dbName: "SHIPPING_TYPE_ID",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "NAME",
        dbName: "NAME",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-bdm-"+ConfigId("in-ecommerce-shopify-extractor-10697799")+".bdm_shipping_type",
          destination: "out.c-ecommerce-bdm-"+ConfigId("in-ecommerce-shopify-extractor-10697799")+".bdm_shipping_type.csv",
          columns: [
            "SHIPPING_TYPE_ID",
            "NAME",
          ],
        },
      ],
    },
  },
}

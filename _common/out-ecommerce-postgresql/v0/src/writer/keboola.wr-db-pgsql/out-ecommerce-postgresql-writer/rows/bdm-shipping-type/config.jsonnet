{
  parameters: {
    tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_shipping_type",
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
        nullable: false,
        default: "",
        size: "10485760",
      },
      {
        name: "NAME",
        dbName: "NAME",
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
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_shipping_type",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_shipping_type.csv",
          columns: [
            "SHIPPING_TYPE_ID",
            "NAME",
          ],
          changed_since: "",
        },
      ],
    },
  },
}

{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_order_lines",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_order_lines.csv",
          changed_since: "",
          columns: [
            "ORDER_ID",
            "ORDER_LINE_ID",
            "ORDER_DATE",
            "ORDER_LINE_PRODUCT_ID",
            "ITEMNAME",
            "DISCOUNT_PERCENT",
            "ORDER_LINE_AMOUNT",
            "ORDER_LINE_PRICE_WITH_VAT",
            "ORDER_LINE_PRICE_WITHOUT_VAT",
            "ORDER_LINE_PRICE_VAT",
            "ORDER_LINE_VAT_RATE",
            "LINE_PURCHASE_PRICE",
            "ORDER_ITEM_TYPE",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "bdm_order_lines",
        tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_order_lines",
        incremental: false,
        items: [
          {
            name: "ORDER_ID",
            dbName: "ORDER_ID",
            type: "STRING",
          },
          {
            name: "ORDER_LINE_ID",
            dbName: "ORDER_LINE_ID",
            type: "STRING",
          },
          {
            name: "ORDER_DATE",
            dbName: "ORDER_DATE",
            type: "STRING",
          },
          {
            name: "ORDER_LINE_PRODUCT_ID",
            dbName: "ORDER_LINE_PRODUCT_ID",
            type: "STRING",
          },
          {
            name: "ITEMNAME",
            dbName: "ITEMNAME",
            type: "STRING",
          },
          {
            name: "DISCOUNT_PERCENT",
            dbName: "DISCOUNT_PERCENT",
            type: "STRING",
          },
          {
            name: "ORDER_LINE_AMOUNT",
            dbName: "ORDER_LINE_AMOUNT",
            type: "FLOAT",
          },
          {
            name: "ORDER_LINE_PRICE_WITH_VAT",
            dbName: "ORDER_LINE_PRICE_WITH_VAT",
            type: "FLOAT",
          },
          {
            name: "ORDER_LINE_PRICE_WITHOUT_VAT",
            dbName: "ORDER_LINE_PRICE_WITHOUT_VAT",
            type: "FLOAT",
          },
          {
            name: "ORDER_LINE_PRICE_VAT",
            dbName: "ORDER_LINE_PRICE_VAT",
            type: "FLOAT",
          },
          {
            name: "ORDER_LINE_VAT_RATE",
            dbName: "ORDER_LINE_VAT_RATE",
            type: "FLOAT",
          },
          {
            name: "LINE_PURCHASE_PRICE",
            dbName: "LINE_PURCHASE_PRICE",
            type: "FLOAT",
          },
          {
            name: "ORDER_ITEM_TYPE",
            dbName: "ORDER_ITEM_TYPE",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

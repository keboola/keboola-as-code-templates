{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-beer-demo.sales",
          destination: "out.c-beer-demo.sales.csv",
          changed_since: "",
          columns: [
            "BEER_ID",
            "BEER_NAME",
            "BEER_STYLE",
            "ABV",
            "IBU",
            "BITTERNESS",
            "OUNCES",
            "BREWERY_ID",
            "BREWERY_NAME",
            "BREWERY_CITY",
            "BREWERY_STATE",
            "BREWERY_COUNTRY",
            "ORDER_NO",
            "ORDER_LINE",
            "ORDER_CREATED_AT",
            "ORDER_LI_QUANTITY",
            "ORDER_LI_PRICE_EACH",
            "ORDER_LI_PRICE_TOTAL",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "sales",
        tableId: "out.c-beer-demo.sales",
        incremental: false,
        items: [
          {
            name: "BEER_ID",
            dbName: "BEER_ID",
            type: "FLOAT",
          },
          {
            name: "BEER_NAME",
            dbName: "BEER_NAME",
            type: "STRING",
          },
          {
            name: "BEER_STYLE",
            dbName: "BEER_STYLE",
            type: "STRING",
          },
          {
            name: "ABV",
            dbName: "ABV",
            type: "FLOAT",
          },
          {
            name: "IBU",
            dbName: "IBU",
            type: "FLOAT",
          },
          {
            name: "BITTERNESS",
            dbName: "BITTERNESS",
            type: "STRING",
          },
          {
            name: "OUNCES",
            dbName: "OUNCES",
            type: "FLOAT",
          },
          {
            name: "BREWERY_ID",
            dbName: "BREWERY_ID",
            type: "INTEGER",
          },
          {
            name: "BREWERY_NAME",
            dbName: "BREWERY_NAME",
            type: "STRING",
          },
          {
            name: "BREWERY_CITY",
            dbName: "BREWERY_CITY",
            type: "STRING",
          },
          {
            name: "BREWERY_STATE",
            dbName: "BREWERY_STATE",
            type: "STRING",
          },
          {
            name: "BREWERY_COUNTRY",
            dbName: "BREWERY_COUNTRY",
            type: "STRING",
          },
          {
            name: "ORDER_NO",
            dbName: "ORDER_NO",
            type: "INTEGER",
          },
          {
            name: "ORDER_LINE",
            dbName: "ORDER_LINE",
            type: "INTEGER",
          },
          {
            name: "ORDER_CREATED_AT",
            dbName: "ORDER_CREATED_AT",
            type: "DATE",
          },
          {
            name: "ORDER_LI_QUANTITY",
            dbName: "ORDER_LI_QUANTITY",
            type: "INTEGER",
          },
          {
            name: "ORDER_LI_PRICE_EACH",
            dbName: "ORDER_LI_PRICE_EACH",
            type: "FLOAT",
          },
          {
            name: "ORDER_LI_PRICE_TOTAL",
            dbName: "ORDER_LI_PRICE_TOTAL",
            type: "FLOAT",
          },
        ],
      },
    ],
  },
}

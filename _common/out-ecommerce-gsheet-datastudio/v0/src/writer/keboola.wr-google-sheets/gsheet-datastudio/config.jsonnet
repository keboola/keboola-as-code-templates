{
  authorization: {
    oauth_api: Input("g3s2-oauth-datastudio"),
  },
  parameters: {
    tables: [
      {
        id: 55384,
        action: "update",
        sheetTitle: "OrderLines",
        enabled: true,
        tableId: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmOrderLinesEnrich",
        title: "Ecommerce-"+ InstanceIdShort(),
        sheetId: 808566483,
        fileId: Input("data-studio-gsheet-id")
      },
      {
        id: 92020,
        action: "update",
        sheetTitle: "Products",
        enabled: true,
        tableId: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmProductsEnrich",
        title: "Ecommerce-"+ InstanceIdShort(),
        fileId: Input("data-studio-gsheet-id"),
        sheetId: 1971809397
      },
      {
        id: 79643,
        action: "update",
        sheetTitle: "Orders",
        enabled: true,
        tableId: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmOrdersEnrich",
        title: "Ecommerce-"+ InstanceIdShort(),
        fileId: Input("data-studio-gsheet-id"),
        sheetId: 1897931633
      },
      {
        id: 4741,
        action: "update",
        sheetTitle: "Shop",
        enabled: true,
        tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".out_shop",
        title: "Ecommerce-"+ InstanceIdShort(),
        fileId: Input("data-studio-gsheet-id"),
        sheetId: 2004245856
      },
      {
        id: 59540,
        action: "update",
        sheetTitle: "Rfm",
        enabled: true,
        tableId: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmRfmEnrich",
        title: "Ecommerce-"+ InstanceIdShort(),
        fileId: Input("data-studio-gsheet-id"),
        sheetId: 58207103
      },
      {
        id: 91943,
        action: "update",
        sheetTitle: "Customers",
        enabled: true,
        tableId: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmCustomerEnrich",
        title: "Ecommerce-"+ InstanceIdShort(),
        fileId: Input("data-studio-gsheet-id"),
        sheetId: 1941383969
      }
    ]
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmOrderLinesEnrich",
          destination: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmOrderLinesEnrich.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmProductsEnrich",
          destination: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmProductsEnrich.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmOrdersEnrich",
          destination: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmOrdersEnrich.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".out_shop",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".out_shop.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmRfmEnrich",
          destination: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmRfmEnrich.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        },
        {
          source: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmCustomerEnrich",
          destination: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmCustomerEnrich.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: []
        }
      ]
    }
  }
}

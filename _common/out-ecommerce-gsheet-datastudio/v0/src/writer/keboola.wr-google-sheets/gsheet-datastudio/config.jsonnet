{
  authorization: {
    oauth_api: {}
  },
  parameters: {
    tables: [
      {
        id: 55384,
        action: "update",
        sheetTitle: "bdmOrderLinesEnrich",
        enabled: true,
        tableId: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmOrderLinesEnrich",
        title: "Ecommerce-"+ InstanceIdShort(),
        sheetId: 0,
        fileId: "1bMRx54sRUTpI6ZtLMkQD2MJtoJywHGPyKgoB8htRj4s"
      },
      {
        id: 92020,
        action: "update",
        sheetTitle: "bdmProductsEnrich",
        enabled: true,
        tableId: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmProductsEnrich",
        title: "Ecommerce-"+ InstanceIdShort(),
        fileId: "1bMRx54sRUTpI6ZtLMkQD2MJtoJywHGPyKgoB8htRj4s",
        sheetId: 72132448
      },
      {
        id: 22050,
        action: "update",
        sheetTitle: "bdmOrderLinesMargin",
        enabled: true,
        tableId: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmOrderLinesMargin",
        title: "Ecommerce-"+ InstanceIdShort(),
        fileId: "1bMRx54sRUTpI6ZtLMkQD2MJtoJywHGPyKgoB8htRj4s",
        sheetId: 1610120104
      },
      {
        id: 79643,
        action: "update",
        sheetTitle: "bdmOrdersEnrich",
        enabled: true,
        tableId: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmOrdersEnrich",
        title: "Ecommerce-"+ InstanceIdShort(),
        fileId: "1bMRx54sRUTpI6ZtLMkQD2MJtoJywHGPyKgoB8htRj4s",
        sheetId: 1319559754
      },
      {
        id: 4741,
        action: "update",
        sheetTitle: "bdmShop",
        enabled: true,
        tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".out_shop",
        title: "Ecommerce-"+ InstanceIdShort(),
        fileId: "1bMRx54sRUTpI6ZtLMkQD2MJtoJywHGPyKgoB8htRj4s",
        sheetId: 81153094
      },
      {
        id: 59540,
        action: "update",
        sheetTitle: "bdmRfm",
        enabled: true,
        tableId: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmRfmEnrich",
        title: "Ecommerce-"+ InstanceIdShort(),
        fileId: "1bMRx54sRUTpI6ZtLMkQD2MJtoJywHGPyKgoB8htRj4s",
        sheetId: 100102089
      },
      {
        id: 91943,
        action: "update",
        sheetTitle: "bdmCustomerEnrich",
        enabled: true,
        tableId: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmCustomerEnrich",
        title: "Ecommerce-"+ InstanceIdShort(),
        fileId: "1bMRx54sRUTpI6ZtLMkQD2MJtoJywHGPyKgoB8htRj4s",
        sheetId: 388560759
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
          source: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmOrderLinesMargin",
          destination: "out.c-ecommerce-wr-ds" + InstanceIdShort() + ".bdmOrderLinesMargin.csv",
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
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".out_shop",
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

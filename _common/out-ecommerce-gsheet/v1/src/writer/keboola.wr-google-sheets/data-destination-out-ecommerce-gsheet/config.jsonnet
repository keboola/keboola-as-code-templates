{
  authorization: {
    oauth_api: Input("oauth-googlesheet"),
  },
  parameters: {
    tables:[
      {
        id: 87348,
        action: "update",
        sheetTitle: "bdm_orders",
        enabled: true,
        tableId: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_orders",
        title: "Template: ECOMMERCE",
        sheetId: 0,
        fileId: Input("google-sheet-id"),
      },
      {
        id: 30117,
        action: "update",
        sheetTitle: "bdm_order_lines",
        enabled: true,
        tableId: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_order_lines",
        title: "Template: ECOMMERCE",
        fileId: Input("google-sheet-id"),
        sheetId: 1310180174,
      },
      {
        id: 97670,
        action: "update",
        sheetTitle: "bdm_products",
        enabled: true,
        tableId: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_products",
        title: "Template: ECOMMERCE",
        fileId: Input("google-sheet-id"),
        sheetId: 482934771,
      },
      {
        id: 15999,
        action: "update",
        sheetTitle: "bdm_customers",
        enabled: true,
        tableId: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_customers",
        title: "Template: ECOMMERCE",
        fileId: Input("google-sheet-id"),
        sheetId: 299229919,
      },
    ]
  },
  storage: {
    input: {
      tables:[
        {
          source: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_orders",
          destination: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_orders.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_order_lines",
          destination: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_order_lines.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_products",
          destination: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_products.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_customers",
          destination: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_customers.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ]
    },
  },
}

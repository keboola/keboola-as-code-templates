{
  authorization: {
    oauth_api: Input("oauth-google-sheets"),
  },
  parameters: {
    tables: 
      {
        id: 64957,
        action: "update",
        sheetTitle: "online_marketing",
        enabled: true,
        tableId: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing",
        title: "online_marketing",
        fileId: Input("google-sheet-id"),
        sheetId: 1942861239,
      },
  },
  storage: {
    input: {
      tables: 
        {
          source: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing",
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
    },
  },
}

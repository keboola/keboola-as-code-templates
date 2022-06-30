{
  authorization: {
    oauth_api: Input("g3s2-oauth-googlesheet"),
  },
  parameters: {
    tables: std.filter(function(v) v != null,[
      if InputIsAvailable("ga-from") then
      {
        id: 38638,
        action: "update",
        sheetTitle: "keywords_adgroup",
        enabled: true,
        tableId: "out.c-marketing-bdm-" + InstanceIdShort() + ".keywords_adgroup",
        title: "online_marketing",
        sheetId: 0,
        fileId: Input("google-sheet-id"),
      },
      if InputIsAvailable("ga-from") then
      {
        id: 1070,
        action: "update",
        sheetTitle: "online_marketing_traffic",
        enabled: true,
        tableId: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_traffic",
        title: "online_marketing",
        fileId: Input("google-sheet-id"),
        sheetId: 1468111673,
      },
      if InputIsAvailable("ga-from") then
      {
        id: 64959,
        action: "update",
        sheetTitle: "online_marketing_transactions",
        enabled: true,
        tableId: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_transactions",
        title: "online_marketing",
        fileId: Input("google-sheet-id"),
        sheetId: 1616225391,
      },
      if InputIsAvailable("ga-from") == false then
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
    ]),
  },
  storage: {
    input: {
      tables: std.filter(function(v) v != null,[
        if InputIsAvailable("ga-from") then
        {
          source: "out.c-marketing-bdm-" + InstanceIdShort() + ".keywords_adgroup",
          destination: "out.c-marketing-bdm-" + InstanceIdShort() + ".keywords_adgroup.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        if InputIsAvailable("ga-from") then
        {
          source: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_traffic",
          destination: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_traffic.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        if InputIsAvailable("ga-from") then
        {
          source: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_transactions",
          destination: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_transactions.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        if InputIsAvailable("ga-from") == false then
        {
          source: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing",
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ]),
    },
  },
}

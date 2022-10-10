{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing",
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing.csv",
          changed_since: "adaptive",
          columns: [
            "online_marketing_traffic_id",
            "account_name",
            "date",
            "source",
            "medium",
            "campaign",
            "domain",
            "impressions",
            "clicks",
            "costs_cpc",
            "costs_conversion"
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "online_marketing",
        tableId: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing",
        incremental: true,
        items: [
          {
            name: "online_marketing_traffic_id",
            dbName: "online_marketing_traffic_id",
            type: "STRING",
          },
          {
            name: "account_name",
            dbName: "account_name",
            type: "STRING",
          },
          {
            name: "date",
            dbName: "date",
            type: "STRING",
          },
          {
            name: "source",
            dbName: "source",
            type: "STRING",
          },
          {
            name: "medium",
            dbName: "medium",
            type: "STRING",
          },
          {
            name: "campaign",
            dbName: "campaign",
            type: "STRING",
          },
          {
            name: "domain",
            dbName: "domain",
            type: "STRING",
          },
          {
            name: "impressions",
            dbName: "impressions",
            type: "FLOAT",
          },
          {
            name: "clicks",
            dbName: "clicks",
            type: "FLOAT",
          },
          {
            name: "costs_cpc",
            dbName: "costs_cpc",
            type: "FLOAT",
          },
          {
            name: "costs_coversion",
            dbName: "costs_coversion",
            type: "FLOAT",
          },
        ],
      },
    ],
  },
}

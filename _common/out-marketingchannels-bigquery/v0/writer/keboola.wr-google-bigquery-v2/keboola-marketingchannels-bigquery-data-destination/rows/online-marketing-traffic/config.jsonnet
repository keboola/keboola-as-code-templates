{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_traffic",
          destination: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_traffic.csv",
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
            "costs_conversion",
            "sessions_new",
            "sessions_return",
            "pageviews",
            "bounces",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "online_marketing_traffic",
        tableId: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_traffic",
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
            name: "costs_conversion",
            dbName: "costs_conversion",
            type: "FLOAT",
          },
          {
            name: "sessions_new",
            dbName: "sessions_new",
            type: "FLOAT",
          },
          {
            name: "sessions_return",
            dbName: "sessions_return",
            type: "FLOAT",
          },
          {
            name: "pageviews",
            dbName: "pageviews",
            type: "FLOAT",
          },
          {
            name: "bounces",
            dbName: "bounces",
            type: "FLOAT",
          },
        ],
      },
    ],
  },
}

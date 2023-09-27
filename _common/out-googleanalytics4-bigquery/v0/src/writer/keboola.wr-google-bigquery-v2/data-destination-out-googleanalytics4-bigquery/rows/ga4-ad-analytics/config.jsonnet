{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_ad_analytics",
          destination: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_ad_analytics.csv",
          changed_since: "adaptive",
          columns: [
            "id",
            "idProperty",
            "date",
            "adGroup",
            "adNetworkType",
            "campaign",
            "adImpressions",
            "adClicks",
            "adCost",
            "adCPC",
            "averagePurchaseRevenue",
            "sessions",
            "engagedSessions",
            "bounces",
            "conversions",
            "activeUsers",
            "screenPageViews",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "ga4_ad_analytics",
        tableId: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_ad_analytics",
        incremental: true,
        items: [
          {
            name: "id",
            dbName: "id",
            type: "STRING",
          },
          {
            name: "idProperty",
            dbName: "idProperty",
            type: "STRING",
          },
          {
            name: "date",
            dbName: "date",
            type: "DATE",
          },
          {
            name: "adGroup",
            dbName: "adGroup",
            type: "STRING",
          },
          {
            name: "adNetworkType",
            dbName: "adNetworkType",
            type: "STRING",
          },
          {
            name: "campaign",
            dbName: "campaign",
            type: "STRING",
          },
          {
            name: "adImpressions",
            dbName: "adImpressions",
            type: "FLOAT",
          },
          {
            name: "adClicks",
            dbName: "adClicks",
            type: "FLOAT",
          },
          {
            name: "adCost",
            dbName: "adCost",
            type: "FLOAT",
          },
          {
            name: "adCPC",
            dbName: "adCPC",
            type: "FLOAT",
          },
          {
            name: "averagePurchaseRevenue",
            dbName: "averagePurchaseRevenue",
            type: "FLOAT",
          },
          {
            name: "sessions",
            dbName: "sessions",
            type: "FLOAT",
          },
          {
            name: "engagedSessions",
            dbName: "engagedSessions",
            type: "FLOAT",
          },
          {
            name: "bounces",
            dbName: "bounces",
            type: "FLOAT",
          },
          {
            name: "conversions",
            dbName: "conversions",
            type: "FLOAT",
          },
          {
            name: "activeUsers",
            dbName: "activeUsers",
            type: "FLOAT",
          },
          {
            name: "screenPageViews",
            dbName: "screenPageViews",
            type: "FLOAT",
          },
        ],
      },
    ],
  },
}

{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".ga_ad_analytics",
          destination: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".ga_ad_analytics.csv",
          changed_since: "",
          columns: [
            "id_TBE",
            "ga_date",
            "ga_adGroup",
            "ga_adContent",
            "ga_adDistributionNetwork",
            "ga_campaign",
            "ga_adSlot",
            "ga_impressions",
            "ga_adClicks",
            "ga_adCost",
            "ga_CPM",
            "ga_CPC",
            "ga_transactionRevenue",
            "ga_sessions",
            "ga_bounces",
            "ga_users",
            "ga_pageviews",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "ga_ad_analytics",
        tableId: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".ga_ad_analytics",
        incremental: false,
        items: [
          {
            name: "id_TBE",
            dbName: "id_TBE",
            type: "STRING",
          },
          {
            name: "ga_date",
            dbName: "ga_date",
            type: "STRING",
          },
          {
            name: "ga_adGroup",
            dbName: "ga_adGroup",
            type: "STRING",
          },
          {
            name: "ga_adContent",
            dbName: "ga_adContent",
            type: "STRING",
          },
          {
            name: "ga_adDistributionNetwork",
            dbName: "ga_adDistributionNetwork",
            type: "STRING",
          },
          {
            name: "ga_campaign",
            dbName: "ga_campaign",
            type: "STRING",
          },
          {
            name: "ga_adSlot",
            dbName: "ga_adSlot",
            type: "STRING",
          },
          {
            name: "ga_impressions",
            dbName: "ga_impressions",
            type: "STRING",
          },
          {
            name: "ga_adClicks",
            dbName: "ga_adClicks",
            type: "STRING",
          },
          {
            name: "ga_adCost",
            dbName: "ga_adCost",
            type: "STRING",
          },
          {
            name: "ga_CPM",
            dbName: "ga_CPM",
            type: "STRING",
          },
          {
            name: "ga_CPC",
            dbName: "ga_CPC",
            type: "STRING",
          },
          {
            name: "ga_transactionRevenue",
            dbName: "ga_transactionRevenue",
            type: "STRING",
          },
          {
            name: "ga_sessions",
            dbName: "ga_sessions",
            type: "STRING",
          },
          {
            name: "ga_bounces",
            dbName: "ga_bounces",
            type: "STRING",
          },
          {
            name: "ga_users",
            dbName: "ga_users",
            type: "STRING",
          },
          {
            name: "ga_pageviews",
            dbName: "ga_pageviews",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

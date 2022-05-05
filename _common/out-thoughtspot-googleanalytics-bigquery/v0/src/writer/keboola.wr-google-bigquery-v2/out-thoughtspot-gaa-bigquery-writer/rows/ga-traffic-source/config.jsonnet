{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".ga_traffic_source",
          destination: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".ga_traffic_source.csv",
          changed_since: "",
          columns: [
            "id_TBE",
            "ga_userType",
            "ga_date",
            "ga_campaign",
            "ga_source",
            "ga_medium",
            "ga_keyword",
            "ga_adContent",
            "ga_socialNetwork",
            "ga_channelGrouping",
            "ga_sessions",
            "ga_users",
            "ga_bounces",
            "ga_sessionDuration",
            "ga_pageviews",
            "ga_organicSearches",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "ga_traffic_source",
        tableId: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".ga_traffic_source",
        incremental: false,
        items: [
          {
            name: "id_TBE",
            dbName: "id_TBE",
            type: "STRING",
          },
          {
            name: "ga_userType",
            dbName: "ga_userType",
            type: "STRING",
          },
          {
            name: "ga_date",
            dbName: "ga_date",
            type: "STRING",
          },
          {
            name: "ga_campaign",
            dbName: "ga_campaign",
            type: "STRING",
          },
          {
            name: "ga_source",
            dbName: "ga_source",
            type: "STRING",
          },
          {
            name: "ga_medium",
            dbName: "ga_medium",
            type: "STRING",
          },
          {
            name: "ga_keyword",
            dbName: "ga_keyword",
            type: "STRING",
          },
          {
            name: "ga_adContent",
            dbName: "ga_adContent",
            type: "STRING",
          },
          {
            name: "ga_socialNetwork",
            dbName: "ga_socialNetwork",
            type: "STRING",
          },
          {
            name: "ga_channelGrouping",
            dbName: "ga_channelGrouping",
            type: "STRING",
          },
          {
            name: "ga_sessions",
            dbName: "ga_sessions",
            type: "STRING",
          },
          {
            name: "ga_users",
            dbName: "ga_users",
            type: "STRING",
          },
          {
            name: "ga_bounces",
            dbName: "ga_bounces",
            type: "STRING",
          },
          {
            name: "ga_sessionDuration",
            dbName: "ga_sessionDuration",
            type: "STRING",
          },
          {
            name: "ga_pageviews",
            dbName: "ga_pageviews",
            type: "STRING",
          },
          {
            name: "ga_organicSearches",
            dbName: "ga_organicSearches",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_traffic_source",
          destination: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_traffic_source.csv",
          changed_since: "adaptive",
          columns: [
            "id",
            "idProperty",
            "date",
            "campaign",
            "medium",
            "source",
            "userType",
            "channelGrouping",
            "sessions",
            "engagedSessions",
            "bounces",
            "activeUsers",
            "newUsers",
            "totalUsers",
            "userEngagementDuration",
            "averageSessionDuration",
            "screenPageViews",
            "conversions",
            "eventCount",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "ga4_traffic_source",
        tableId: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_traffic_source",
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
            name: "campaign",
            dbName: "campaign",
            type: "STRING",
          },
          {
            name: "medium",
            dbName: "medium",
            type: "STRING",
          },
          {
            name: "source",
            dbName: "source",
            type: "STRING",
          },
          {
            name: "userType",
            dbName: "userType",
            type: "STRING",
          },
          {
            name: "channelGrouping",
            dbName: "channelGrouping",
            type: "STRING",
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
            name: "activeUsers",
            dbName: "activeUsers",
            type: "FLOAT",
          },
          {
            name: "newUsers",
            dbName: "newUsers",
            type: "FLOAT",
          },
          {
            name: "totalUsers",
            dbName: "totalUsers",
            type: "FLOAT",
          },
          {
            name: "userEngagementDuration",
            dbName: "userEngagementDuration",
            type: "FLOAT",
          },
          {
            name: "averageSessionDuration",
            dbName: "averageSessionDuration",
            type: "FLOAT",
          },
          {
            name: "screenPageViews",
            dbName: "screenPageViews",
            type: "FLOAT",
          },
          {
            name: "conversions",
            dbName: "conversions",
            type: "FLOAT",
          },
          {
            name: "eventCount",
            dbName: "eventCount",
            type: "FLOAT",
          },
        ],
      },
    ],
  },
}

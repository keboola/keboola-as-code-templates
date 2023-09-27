{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_geo_audience",
          destination: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_geo_audience.csv",
          changed_since: "adaptive",
          columns: [
            "id",
            "idProperty",
            "date",
            "city",
            "country",
            "region",
            "channelGrouping",
            "userType",
            "sessions",
            "engagedSessions",
            "bounces",
            "activeUsers",
            "newUsers",
            "totalUsers",
            "conversions",
            "userEngagementDuration",
            "averageSessionDuration",
            "screenPageViews",
            "eventCount",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "ga4_geo_audience",
        tableId: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_geo_audience",
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
            name: "city",
            dbName: "city",
            type: "STRING",
          },
          {
            name: "country",
            dbName: "country",
            type: "STRING",
          },
          {
            name: "region",
            dbName: "region",
            type: "STRING",
          },
          {
            name: "channelGrouping",
            dbName: "channelGrouping",
            type: "STRING",
          },
          {
            name: "userType",
            dbName: "userType",
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
            name: "conversions",
            dbName: "conversions",
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
            name: "eventCount",
            dbName: "eventCount",
            type: "FLOAT",
          },
        ],
      },
    ],
  },
}

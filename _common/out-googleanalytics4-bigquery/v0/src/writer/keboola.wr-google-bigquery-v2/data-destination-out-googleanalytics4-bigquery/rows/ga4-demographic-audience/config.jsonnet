{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_demographic_audience",
          destination: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_demographic_audience.csv",
          changed_since: "adaptive",
          columns: [
            "id",
            "idProperty",
            "date",
            "userAgeBracket",
            "userGender",
            "language",
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
        dbName: "ga4_demographic_audience",
        tableId: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_demographic_audience",
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
            name: "userAgeBracket",
            dbName: "userAgeBracket",
            type: "STRING",
          },
          {
            name: "userGender",
            dbName: "userGender",
            type: "STRING",
          },
          {
            name: "language",
            dbName: "language",
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

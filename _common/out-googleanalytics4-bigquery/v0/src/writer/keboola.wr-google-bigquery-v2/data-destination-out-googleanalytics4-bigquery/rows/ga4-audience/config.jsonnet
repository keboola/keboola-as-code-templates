{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_audience",
          destination: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_audience.csv",
          changed_since: "adaptive",
          columns: [
            "id",
            "idProperty",
            "date",
            "audienceId",
            "audienceName",
            "activeUsers",
            "newUsers",
            "totalUsers",
            "sessions",
            "engagedSessions",
            "screenPageViews",
            "averageSessionDuration",
            "userEngagementDuration",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "ga4_audience",
        tableId: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_audience",
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
            name: "audienceId",
            dbName: "audienceId",
            type: "STRING",
          },
          {
            name: "audienceName",
            dbName: "audienceName",
            type: "STRING",
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
            name: "screenPageViews",
            dbName: "screenPageViews",
            type: "FLOAT",
          },
          {
            name: "averageSessionDuration",
            dbName: "averageSessionDuration",
            type: "FLOAT",
          },
          {
            name: "userEngagementDuration",
            dbName: "userEngagementDuration",
            type: "FLOAT",
          },
        ],
      },
    ],
  },
}

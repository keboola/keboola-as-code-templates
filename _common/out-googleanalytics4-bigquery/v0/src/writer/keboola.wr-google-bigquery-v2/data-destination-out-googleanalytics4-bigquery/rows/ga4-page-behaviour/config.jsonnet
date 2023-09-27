{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_page_behaviour",
          destination: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_page_behaviour.csv",
          changed_since: "adaptive",
          columns: [
            "id",
            "idProperty",
            "date",
            "hostName",
            "pagePath",
            "landingPage",
            "landingpagePlusQueryString",
            "pageTitle",
            "country",
            "deviceCategory",
            "language",
            "sessions",
            "engagedSessions",
            "bounces",
            "activeUsers",
            "newUsers",
            "totalUsers",
            "screenPageViews",
            "conversions",
            "userEngagementDuration",
            "averageSessionDuration",
            "eventCount",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "ga4_page_behaviour",
        tableId: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_page_behaviour",
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
            name: "hostName",
            dbName: "hostName",
            type: "STRING",
          },
          {
            name: "pagePath",
            dbName: "pagePath",
            type: "STRING",
          },
          {
            name: "landingPage",
            dbName: "landingPage",
            type: "STRING",
          },
          {
            name: "landingpagePlusQueryString",
            dbName: "landingpagePlusQueryString",
            type: "STRING",
          },
          {
            name: "pageTitle",
            dbName: "pageTitle",
            type: "STRING",
          },
          {
            name: "country",
            dbName: "country",
            type: "STRING",
          },
          {
            name: "deviceCategory",
            dbName: "deviceCategory",
            type: "STRING",
          },
          {
            name: "language",
            dbName: "language",
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
            name: "eventCount",
            dbName: "eventCount",
            type: "FLOAT",
          },
        ],
      },
    ],
  },
}

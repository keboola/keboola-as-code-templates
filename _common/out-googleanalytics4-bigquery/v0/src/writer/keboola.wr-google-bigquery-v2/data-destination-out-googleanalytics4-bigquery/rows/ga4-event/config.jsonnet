{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_event",
          destination: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_event.csv",
          changed_since: "adaptive",
          columns: [
            "id",
            "idProperty",
            "date",
            "eventName",
            "isConversionEvent",
            "eventCount",
            "eventValue",
            "totalUsers",
            "activeUsers",
            "newUsers",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "ga4_event",
        tableId: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_event",
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
            name: "eventName",
            dbName: "eventName",
            type: "STRING",
          },
          {
            name: "isConversionEvent",
            dbName: "isConversionEvent",
            type: "BOOLEAN",
          },
          {
            name: "eventCount",
            dbName: "eventCount",
            type: "FLOAT",
          },
          {
            name: "eventValue",
            dbName: "eventValue",
            type: "FLOAT",
          },
          {
            name: "totalUsers",
            dbName: "totalUsers",
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
        ],
      },
    ],
  },
}

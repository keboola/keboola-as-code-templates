{
  parameters: {
    tableId: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_traffic_source",
    dbName: "ga4_traffic_source",
    incremental: true,
    primaryKey: [
      "id",
    ],
    items: [
      {
        name: "id",
        dbName: "id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "2000",
      },
      {
        name: "idProperty",
        dbName: "idProperty",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "date",
        dbName: "date",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "campaign",
        dbName: "campaign",
        type: "varchar",
        nullable: true,
        default: "",
        size: "2000",
      },
      {
        name: "medium",
        dbName: "medium",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "source",
        dbName: "source",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "userType",
        dbName: "userType",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "channelGrouping",
        dbName: "channelGrouping",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "sessions",
        dbName: "sessions",
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "engagedSessions",
        dbName: "engagedSessions",
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "bounces",
        dbName: "bounces",
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "activeUsers",
        dbName: "activeUsers",
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "newUsers",
        dbName: "newUsers",
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "totalUsers",
        dbName: "totalUsers",
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "userEngagementDuration",
        dbName: "userEngagementDuration",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "averageSessionDuration",
        dbName: "averageSessionDuration",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "screenPageViews",
        dbName: "screenPageViews",
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "conversions",
        dbName: "conversions",
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "eventCount",
        dbName: "eventCount",
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_traffic_source",
          destination: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_traffic_source.csv",
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
          changed_since: "adaptive",
        },
      ],
    },
  },
}
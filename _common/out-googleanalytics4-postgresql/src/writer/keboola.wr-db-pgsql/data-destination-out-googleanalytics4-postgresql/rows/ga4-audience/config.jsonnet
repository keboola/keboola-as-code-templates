{
  parameters: {
    tableId: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_audience",
    dbName: "ga4_audience",
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
        name: "audienceId",
        dbName: "audienceId",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "audienceName",
        dbName: "audienceName",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "activeUsers",
        dbName: "activeUsers",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "newUsers",
        dbName: "newUsers",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "totalUsers",
        dbName: "totalUsers",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "sessions",
        dbName: "sessions",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "engagedSessions",
        dbName: "engagedSessions",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "screenPageViews",
        dbName: "screenPageViews",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "averageSessionDuration",
        dbName: "averageSessionDuration",
        type: "real",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "userEngagementDuration",
        dbName: "userEngagementDuration",
        type: "real",
        nullable: true,
        default: "",
        size: "",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_audience",
          destination: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_audience.csv",
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
          changed_since: "adaptive",
        },
      ],
    },
  },
}

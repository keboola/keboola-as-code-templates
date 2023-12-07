{
  parameters: {
    tableId: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_ad_analytics",
    dbName: "ga4_ad_analytics",
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
        name: "adGroup",
        dbName: "adGroup",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "adNetworkType",
        dbName: "adNetworkType",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "campaign",
        dbName: "campaign",
        type: "varchar",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "adImpressions",
        dbName: "adImpressions",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "adClicks",
        dbName: "adClicks",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "adCost",
        dbName: "adCost",
        type: "real",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "adCPC",
        dbName: "adCPC",
        type: "real",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "averagePurchaseRevenue",
        dbName: "averagePurchaseRevenue",
        type: "real",
        nullable: true,
        default: "",
        size: "",
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
        name: "bounces",
        dbName: "bounces",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "conversions",
        dbName: "conversions",
        type: "numeric",
        nullable: true,
        default: "",
        size: "38,0",
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
        name: "screenPageViews",
        dbName: "screenPageViews",
        type: "numeric",
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
          source: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_ad_analytics",
          destination: "out.c-bdm-ga4-" + InstanceIdShort() + ".ga4_ad_analytics.csv",
          columns: [
            "id",
            "idProperty",
            "date",
            "adGroup",
            "adNetworkType",
            "campaign",
            "adImpressions",
            "adClicks",
            "adCost",
            "adCPC",
            "averagePurchaseRevenue",
            "sessions",
            "engagedSessions",
            "bounces",
            "conversions",
            "activeUsers",
            "screenPageViews",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}
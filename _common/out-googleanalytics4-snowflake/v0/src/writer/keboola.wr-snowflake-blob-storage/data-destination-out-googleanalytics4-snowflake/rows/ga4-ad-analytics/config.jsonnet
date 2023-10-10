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
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "adClicks",
        dbName: "adClicks",
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "adCost",
        dbName: "adCost",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "adCPC",
        dbName: "adCPC",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "averagePurchaseRevenue",
        dbName: "averagePurchaseRevenue",
        type: "float",
        nullable: true,
        default: "",
        size: "",
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
        name: "conversions",
        dbName: "conversions",
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
        name: "screenPageViews",
        dbName: "screenPageViews",
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

{
  parameters: {
    tableId: "out.c-bdm-" + InstanceIdShort() + ".ga_traffic_source",
    dbName: "ga_traffic_source",
    incremental: false,
    primaryKey: [
      "id_TBE",
    ],
    items: [
      {
        name: "id_TBE",
        dbName: "id_TBE",
        type: "varchar",
        nullable: false,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_userType",
        dbName: "ga_userType",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_date",
        dbName: "ga_date",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_campaign",
        dbName: "ga_campaign",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_source",
        dbName: "ga_source",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_medium",
        dbName: "ga_medium",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_keyword",
        dbName: "ga_keyword",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_adContent",
        dbName: "ga_adContent",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_socialNetwork",
        dbName: "ga_socialNetwork",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_channelGrouping",
        dbName: "ga_channelGrouping",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_sessions",
        dbName: "ga_sessions",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_users",
        dbName: "ga_users",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_bounces",
        dbName: "ga_bounces",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_sessionDuration",
        dbName: "ga_sessionDuration",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_pageviews",
        dbName: "ga_pageviews",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_organicSearches",
        dbName: "ga_organicSearches",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-bdm-" + InstanceIdShort() + ".ga_traffic_source",
          destination: "out.c-bdm-" + InstanceIdShort() + ".ga_traffic_source.csv",
          columns: [
            "id_TBE",
            "ga_userType",
            "ga_date",
            "ga_campaign",
            "ga_source",
            "ga_medium",
            "ga_keyword",
            "ga_adContent",
            "ga_socialNetwork",
            "ga_channelGrouping",
            "ga_sessions",
            "ga_users",
            "ga_bounces",
            "ga_sessionDuration",
            "ga_pageviews",
            "ga_organicSearches",
          ],
        },
      ],
    },
  },
}

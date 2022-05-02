{
  parameters: {
    tableId: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".ga_geo_audience",
    dbName: "ga_geo_audience",
    incremental: false,
    primaryKey: [
      "id_TBE",
    ],
    items: [
      {
        name: "id_TBE",
        dbName: "id_TBE",
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
        name: "ga_country",
        dbName: "ga_country",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_region",
        dbName: "ga_region",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_latitude",
        dbName: "ga_latitude",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ga_longitude",
        dbName: "ga_longitude",
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
        name: "ga_userType",
        dbName: "ga_userType",
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
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".ga_geo_audience",
          destination: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".ga_geo_audience.csv",
          columns: [
            "id_TBE",
            "ga_date",
            "ga_country",
            "ga_region",
            "ga_latitude",
            "ga_longitude",
            "ga_channelGrouping",
            "ga_userType",
            "ga_source",
            "ga_medium",
            "ga_sessions",
            "ga_users",
            "ga_bounces",
            "ga_sessionDuration",
            "ga_pageviews",
          ],
        },
      ],
    },
  },
}

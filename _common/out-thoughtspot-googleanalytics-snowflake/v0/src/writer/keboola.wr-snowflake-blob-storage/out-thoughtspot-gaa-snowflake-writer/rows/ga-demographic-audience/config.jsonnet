{
  parameters: {
    tableId: "out.c-wr-" + InstanceIdShort() + ".ga_demographic_audience",
    dbName: "GA_DEMOGRAPHIC_AUDIENCE",
    incremental: false,
    primaryKey: [],
    items: [
      {
        name: "id_TBE",
        type: "IGNORE",
      },
      {
        name: "ga_date",
        dbName: "ga:date",
        type: "date",
        nullable: true,
        default: "",
      },
      {
        name: "ga_userAgeBracket",
        dbName: "ga:userAgeBracket",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "ga_userGender",
        dbName: "ga:userGender",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "ga_interestAffinityCategory",
        dbName: "ga:interestAffinityCategory",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "ga_channelGrouping",
        dbName: "ga:channelGrouping",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "ga_userType",
        dbName: "ga:userType",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "ga_source",
        dbName: "ga:source",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "ga_medium",
        dbName: "ga:medium",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "ga_sessions",
        dbName: "ga:sessions",
        type: "integer",
        nullable: true,
        default: "",
      },
      {
        name: "ga_users",
        dbName: "ga:users",
        type: "integer",
        nullable: true,
        default: "",
      },
      {
        name: "ga_bounces",
        dbName: "ga:bounces",
        type: "integer",
        nullable: true,
        default: "",
      },
      {
        name: "ga_sessionDuration",
        dbName: "ga:sessionDuration",
        type: "double",
        nullable: true,
        default: "",
      },
      {
        name: "ga_pageviews",
        dbName: "ga:pageviews",
        type: "double",
        nullable: true,
        default: "",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-wr-" + InstanceIdShort() + ".ga_demographic_audience",
          destination: "out.c-wr-" + InstanceIdShort() + ".ga_demographic_audience.csv",
          columns: [
            "id_TBE",
            "ga_date",
            "ga_userAgeBracket",
            "ga_userGender",
            "ga_interestAffinityCategory",
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

{
  parameters: {
    tableId: "out.c-bdm-" + InstanceIdShort() + ".ga_site_statistics",
    dbName: "GA_SITE_STATISTICS",
    incremental: false,
    primaryKey: [],
    items: [
      {
        name: "ga_date",
        dbName: "ga:date",
        type: "date",
        nullable: true,
        default: "",
      },
      {
        name: "ga_time",
        dbName: "ga:time",
        type: "time",
        nullable: true,
        default: "",
        size: "9",
      },
      {
        name: "ga_hostname",
        dbName: "ga:hostname",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "ga_pagePath",
        dbName: "ga:pagePath",
        type: "string",
        nullable: true,
        default: "",
        size: "2048",
      },
      {
        name: "ga_country",
        dbName: "ga:country",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "ga_browser",
        dbName: "ga:browser",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "ga_operatingSystemVersion",
        dbName: "ga:operatingSystemVersion",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "ga_deviceCategory",
        dbName: "ga:deviceCategory",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "ga_operatingSystem",
        dbName: "ga:operatingSystem",
        type: "string",
        nullable: true,
        default: "",
        size: "255",
      },
      {
        name: "ga_language",
        dbName: "ga:language",
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
        name: "ga_pageviews",
        dbName: "ga:pageviews",
        type: "integer",
        nullable: true,
        default: "",
      },
      {
        name: "ga_avgPageLoadTime",
        dbName: "ga:avgPageLoadTime",
        type: "double",
        nullable: true,
        default: "",
      },
      {
        name: "ga_avgPageDownloadTime",
        dbName: "ga:avgPageDownloadTime",
        type: "double",
        nullable: true,
        default: "",
      },
      {
        name: "ga_avgRedirectionTime",
        dbName: "ga:avgRedirectionTime",
        type: "double",
        nullable: true,
        default: "",
      },
      {
        name: "ga_avgServerConnectionTime",
        dbName: "ga:avgServerConnectionTime",
        type: "double",
        nullable: true,
        default: "",
      },
      {
        name: "ga_serverResponseTime",
        dbName: "ga:serverResponseTime",
        type: "integer",
        nullable: true,
        default: "",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-bdm-" + InstanceIdShort() + ".ga_site_statistics",
          destination: "out.c-bdm-" + InstanceIdShort() + ".ga_site_statistics.csv",
          columns: [
            "ga_date",
            "ga_time",
            "ga_hostname",
            "ga_pagePath",
            "ga_country",
            "ga_browser",
            "ga_operatingSystemVersion",
            "ga_deviceCategory",
            "ga_operatingSystem",
            "ga_language",
            "ga_sessions",
            "ga_pageviews",
            "ga_avgPageLoadTime",
            "ga_avgPageDownloadTime",
            "ga_avgRedirectionTime",
            "ga_avgServerConnectionTime",
            "ga_serverResponseTime",
          ],
        },
      ],
    },
  },
}

{
  parameters: {
    dbName: "GA_PAGE_BEHAVIOUR",
    tableId: "out.c-wr-" + InstanceIdShort() + ".ga_page_behaviour",
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
        size: "2500",
      },
      {
        name: "ga_landingPagePath",
        dbName: "ga:landingPagePath",
        type: "string",
        nullable: true,
        default: "",
        size: "2500",
      },
      {
        name: "ga_secondPagePath",
        dbName: "ga:secondPagePath",
        type: "string",
        nullable: true,
        default: "",
        size: "2500",
      },
      {
        name: "ga_exitPagePath",
        dbName: "ga:exitPagePath",
        type: "string",
        nullable: true,
        default: "",
        size: "2500",
      },
      {
        name: "ga_pageTitle",
        dbName: "ga:pageTitle",
        type: "string",
        nullable: true,
        default: "",
        size: "2500",
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
        name: "ga_country",
        dbName: "ga:country",
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
        name: "ga_entrances",
        dbName: "ga:entrances",
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
        name: "ga_timeOnPage",
        dbName: "ga:timeOnPage",
        type: "double",
        nullable: true,
        default: "",
      },
      {
        name: "ga_exits",
        dbName: "ga:exits",
        type: "integer",
        nullable: true,
        default: "",
      },
      {
        name: "ga_pageValue",
        dbName: "ga:pageValue",
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
          source: "out.c-wr-" + InstanceIdShort() + ".ga_page_behaviour",
          destination: "out.c-wr-" + InstanceIdShort() + ".ga_page_behaviour.csv",
          columns: [
            "ga_date",
            "ga_hostname",
            "ga_pagePath",
            "ga_landingPagePath",
            "ga_secondPagePath",
            "ga_exitPagePath",
            "ga_pageTitle",
            "ga_source",
            "ga_country",
            "ga_sessions",
            "ga_entrances",
            "ga_pageviews",
            "ga_timeOnPage",
            "ga_exits",
            "ga_pageValue",
          ],
        },
      ],
    },
  },
}

{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-wr-" + InstanceIdShort() + ".ga_page_behaviour",
          destination: "out.c-wr-" + InstanceIdShort() + ".ga_page_behaviour.csv",
          changed_since: "",
          columns: [
            "id_TBE",
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
  parameters: {
    tables: [
      {
        dbName: "ga_page_behaviour",
        tableId: "out.c-wr-" + InstanceIdShort() + ".ga_page_behaviour",
        incremental: false,
        items: [
          {
            name: "id_TBE",
            dbName: "id_TBE",
            type: "STRING",
          },
          {
            name: "ga_date",
            dbName: "ga_date",
            type: "STRING",
          },
          {
            name: "ga_hostname",
            dbName: "ga_hostname",
            type: "STRING",
          },
          {
            name: "ga_pagePath",
            dbName: "ga_pagePath",
            type: "STRING",
          },
          {
            name: "ga_landingPagePath",
            dbName: "ga_landingPagePath",
            type: "STRING",
          },
          {
            name: "ga_secondPagePath",
            dbName: "ga_secondPagePath",
            type: "STRING",
          },
          {
            name: "ga_exitPagePath",
            dbName: "ga_exitPagePath",
            type: "STRING",
          },
          {
            name: "ga_pageTitle",
            dbName: "ga_pageTitle",
            type: "STRING",
          },
          {
            name: "ga_source",
            dbName: "ga_source",
            type: "STRING",
          },
          {
            name: "ga_country",
            dbName: "ga_country",
            type: "STRING",
          },
          {
            name: "ga_sessions",
            dbName: "ga_sessions",
            type: "STRING",
          },
          {
            name: "ga_entrances",
            dbName: "ga_entrances",
            type: "STRING",
          },
          {
            name: "ga_pageviews",
            dbName: "ga_pageviews",
            type: "STRING",
          },
          {
            name: "ga_timeOnPage",
            dbName: "ga_timeOnPage",
            type: "STRING",
          },
          {
            name: "ga_exits",
            dbName: "ga_exits",
            type: "STRING",
          },
          {
            name: "ga_pageValue",
            dbName: "ga_pageValue",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

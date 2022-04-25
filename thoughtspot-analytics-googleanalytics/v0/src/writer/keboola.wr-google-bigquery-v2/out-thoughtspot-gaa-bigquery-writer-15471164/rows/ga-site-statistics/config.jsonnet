{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-"+ConfigId("in-thoughtspot-gaa-extractor-15471164")+".ga_site_statistics",
          destination: "out.c-thoughtspot-wr-"+ConfigId("in-thoughtspot-gaa-extractor-15471164")+".ga_site_statistics.csv",
          changed_since: "",
          columns: [
            "id_TBE",
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
  parameters: {
    tables: [
      {
        dbName: "ga_site_statistics",
        tableId: "out.c-thoughtspot-wr-"+ConfigId("in-thoughtspot-gaa-extractor-15471164")+".ga_site_statistics",
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
            name: "ga_time",
            dbName: "ga_time",
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
            name: "ga_country",
            dbName: "ga_country",
            type: "STRING",
          },
          {
            name: "ga_browser",
            dbName: "ga_browser",
            type: "STRING",
          },
          {
            name: "ga_operatingSystemVersion",
            dbName: "ga_operatingSystemVersion",
            type: "STRING",
          },
          {
            name: "ga_deviceCategory",
            dbName: "ga_deviceCategory",
            type: "STRING",
          },
          {
            name: "ga_operatingSystem",
            dbName: "ga_operatingSystem",
            type: "STRING",
          },
          {
            name: "ga_language",
            dbName: "ga_language",
            type: "STRING",
          },
          {
            name: "ga_sessions",
            dbName: "ga_sessions",
            type: "STRING",
          },
          {
            name: "ga_pageviews",
            dbName: "ga_pageviews",
            type: "STRING",
          },
          {
            name: "ga_avgPageLoadTime",
            dbName: "ga_avgPageLoadTime",
            type: "STRING",
          },
          {
            name: "ga_avgPageDownloadTime",
            dbName: "ga_avgPageDownloadTime",
            type: "STRING",
          },
          {
            name: "ga_avgRedirectionTime",
            dbName: "ga_avgRedirectionTime",
            type: "STRING",
          },
          {
            name: "ga_avgServerConnectionTime",
            dbName: "ga_avgServerConnectionTime",
            type: "STRING",
          },
          {
            name: "ga_serverResponseTime",
            dbName: "ga_serverResponseTime",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

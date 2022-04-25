{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-"+ConfigId("in-thoughtspot-gaa-extractor-15471164")+".ga_geo_audience",
          destination: "out.c-thoughtspot-wr-"+ConfigId("in-thoughtspot-gaa-extractor-15471164")+".ga_geo_audience.csv",
          changed_since: "",
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
  parameters: {
    tables: [
      {
        dbName: "ga_geo_audience",
        tableId: "out.c-thoughtspot-wr-"+ConfigId("in-thoughtspot-gaa-extractor-15471164")+".ga_geo_audience",
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
            name: "ga_country",
            dbName: "ga_country",
            type: "STRING",
          },
          {
            name: "ga_region",
            dbName: "ga_region",
            type: "STRING",
          },
          {
            name: "ga_latitude",
            dbName: "ga_latitude",
            type: "STRING",
          },
          {
            name: "ga_longitude",
            dbName: "ga_longitude",
            type: "STRING",
          },
          {
            name: "ga_channelGrouping",
            dbName: "ga_channelGrouping",
            type: "STRING",
          },
          {
            name: "ga_userType",
            dbName: "ga_userType",
            type: "STRING",
          },
          {
            name: "ga_source",
            dbName: "ga_source",
            type: "STRING",
          },
          {
            name: "ga_medium",
            dbName: "ga_medium",
            type: "STRING",
          },
          {
            name: "ga_sessions",
            dbName: "ga_sessions",
            type: "STRING",
          },
          {
            name: "ga_users",
            dbName: "ga_users",
            type: "STRING",
          },
          {
            name: "ga_bounces",
            dbName: "ga_bounces",
            type: "STRING",
          },
          {
            name: "ga_sessionDuration",
            dbName: "ga_sessionDuration",
            type: "STRING",
          },
          {
            name: "ga_pageviews",
            dbName: "ga_pageviews",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

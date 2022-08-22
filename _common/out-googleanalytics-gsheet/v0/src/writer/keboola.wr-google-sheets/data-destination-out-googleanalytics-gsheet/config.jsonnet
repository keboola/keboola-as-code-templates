{
  authorization: {
    oauth_api: Input("g3s2-oauth-googlesheet"),
  },
  parameters: {
    tables: [
      {
        id: 66866,
        action: "update",
        sheetTitle: "ga_ad_analytics",
        enabled: true,
        tableId: "out.c-wr-" + InstanceIdShort() + ".ga_ad_analytics",
        title: "OUT_GOOGLEANALYTICS",
        sheetId: 0,
        fileId: Input("google-sheet-id"),
      },
      {
        id: 85260,
        action: "update",
        sheetTitle: "ga_demographic_audience",
        enabled: true,
        tableId: "out.c-wr-" + InstanceIdShort() + ".ga_demographic_audience",
        title: "OUT_GOOGLEANALYTICS",
        fileId: Input("google-sheet-id"),
        sheetId: 1238844550,
      },
      {
        id: 59042,
        action: "update",
        sheetTitle: "ga_geo_audience",
        enabled: true,
        tableId: "out.c-wr-" + InstanceIdShort() + ".ga_geo_audience",
        title: "OUT_GOOGLEANALYTICS",
        fileId: Input("google-sheet-id"),
        sheetId: 1104960848,
      },
      {
        id: 28231,
        action: "update",
        sheetTitle: "ga_page_behaviour",
        enabled: true,
        tableId: "out.c-wr-" + InstanceIdShort() + ".ga_page_behaviour",
        title: "OUT_GOOGLEANALYTICS",
        fileId: Input("google-sheet-id"),
        sheetId: 583223814,
      },
      {
        id: 13950,
        action: "update",
        sheetTitle: "ga_site_statistics",
        enabled: true,
        tableId: "out.c-wr-" + InstanceIdShort() + ".ga_site_statistics",
        title: "OUT_GOOGLEANALYTICS",
        fileId: Input("google-sheet-id"),
        sheetId: 1818748105,
      },
      {
        id: 81454,
        action: "update",
        sheetTitle: "ga_traffic_source",
        enabled: true,
        tableId: "out.c-wr-" + InstanceIdShort() + ".ga_traffic_source",
        title: "OUT_GOOGLEANALYTICS",
        fileId: Input("google-sheet-id"),
        sheetId: 417166026,
      },
      {
        id: 52563,
        action: "update",
        sheetTitle: "gsc_ranking",
        enabled: true,
        tableId: "out.c-bdm-" + InstanceIdShort() + ".gsc_ranking",
        title: "OUT_GOOGLEANALYTICS",
        fileId: Input("google-sheet-id"),
        sheetId: 1279699515,
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-wr-" + InstanceIdShort() + ".ga_ad_analytics",
          destination: "out.c-wr-" + InstanceIdShort() + ".ga_ad_analytics.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-wr-" + InstanceIdShort() + ".ga_demographic_audience",
          destination: "out.c-wr-" + InstanceIdShort() + ".ga_demographic_audience.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-wr-" + InstanceIdShort() + ".ga_geo_audience",
          destination: "out.c-wr-" + InstanceIdShort() + ".ga_geo_audience.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-wr-" + InstanceIdShort() + ".ga_page_behaviour",
          destination: "out.c-wr-" + InstanceIdShort() + ".ga_page_behaviour.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-wr-" + InstanceIdShort() + ".ga_site_statistics",
          destination: "out.c-wr-" + InstanceIdShort() + ".ga_site_statistics.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-wr-" + InstanceIdShort() + ".ga_traffic_source",
          destination: "out.c-wr-" + InstanceIdShort() + ".ga_traffic_source.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-bdm-" + InstanceIdShort() + ".gsc_ranking",
          destination: "out.c-bdm-" + InstanceIdShort() + ".gsc_ranking.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
  },
}
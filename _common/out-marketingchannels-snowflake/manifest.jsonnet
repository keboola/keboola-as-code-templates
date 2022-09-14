{ 
  configurations: std.filter(function(v) v != null,[
    if InputIsAvailable("wr-snowflake-blob-storage-db-host") then
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("keboola-marketingchannels-snowflake-data-destination"),
      path: "writer/keboola.wr-snowflake-blob-storage/keboola-marketingchannels-snowflake-data-destination",
      rows: std.filter(function(v) v != null,[
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("keywords-adgroup-001"),
          path: "rows/keywords-adgroup-001",
        },
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("online-marketing-traffic-001"),
          path: "rows/online-marketing-traffic-001",
        },
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("online-marketing-transactions-001"),
          path: "rows/online-marketing-transactions-001",
        },
        if InputIsAvailable("ga-from") == false then         
        {
          id: ConfigRowId("online-marketing"),
          path: "rows/online-marketing",
        },
      ]),
    },
  ]),
}

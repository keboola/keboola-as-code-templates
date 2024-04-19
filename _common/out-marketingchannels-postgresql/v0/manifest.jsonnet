{ 
  configurations: std.filter(function(v) v != null,[
    if InputIsAvailable("wr-postgresql-db-hostname") then
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("keboola-marketingchannels-postgresql-data-destination"),
      path: "writer/keboola.wr-db-pgsql/keboola-marketingchannels-postgresql-data-destination",
      rows: std.filter(function(v) v != null,[
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("keywords-adgroup"),
          path: "rows/keywords-adgroup",
        },
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("online-marketing-traffic"),
          path: "rows/online-marketing-traffic",
        },
        if InputIsAvailable("ga-from") then
        {
          id: ConfigRowId("online-marketing-transactions"),
          path: "rows/online-marketing-transactions",
        },
        if InputIsAvailable("ga-from") == false then
        {
          id: ConfigRowId("online-marketing"),
          path: "rows/online-marketing",
        }
      ]),
    },
  ]),
}

{ 
  configurations: 
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("keboola-marketingchannels-postgresql-data-destination"),
      path: "writer/keboola.wr-db-pgsql/keboola-marketingchannels-postgresql-data-destination",
      rows: 
        {
          id: ConfigRowId("online-marketing"),
          path: "rows/online-marketing",
        }
    },
}

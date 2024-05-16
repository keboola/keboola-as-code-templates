{ 
  configurations:
    {
      componentId: SnowflakeWriterComponentId(),
      id: ConfigId("keboola-marketingchannels-snowflake-data-destination"),
      path: "writer/keboola.wr-snowflake/keboola-marketingchannels-snowflake-data-destination",
      rows:    
        {
          id: ConfigRowId("online-marketing"),
          path: "rows/online-marketing",
        },
    },
}

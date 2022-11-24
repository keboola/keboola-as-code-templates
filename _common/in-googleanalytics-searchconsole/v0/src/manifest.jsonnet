{
  configurations: [
    {
      componentId: "kds-team.ex-google-search-console",
      id: ConfigId("in-googleanalytics-searchconsole-extractor"),
      path: "extractor/kds-team.ex-google-search-console/in-googleanalytics-searchconsole-extractor",
      rows: [
        {
          id: ConfigRowId("google-search-console"),
          path: "rows/google-search-console",
        },
      ],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-googleanalytics-searchconsole-transformation"),
      path: "transformation/keboola.snowflake-transformation/in-googleanalytics-searchconsole-transformation",
      rows: [],
    },
  ],
}

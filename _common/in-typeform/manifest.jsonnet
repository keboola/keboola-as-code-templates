{ 
  configurations:[
    {
      componentId: "fisa.ex-typeform",
      id: ConfigId("data-source-in-typeform"),
      path: "extractor/fisa.ex-typeform/data-source-in-typeform",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-in-typeform"),
      path: "transformation/keboola.snowflake-transformation/transformation-in-typeform",
      rows: [],
    },
    {
      componentId: "keboola.google-bigquery-transformation",
      id: ConfigId("transformation-in-typeform-bq"),
      path: "transformation/keboola.google-bigquery-transformation/transformation-in-typeform-bq",
      rows: [],
    },
  ],
}

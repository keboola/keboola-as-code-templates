{ mainConfig: {
    componentId: "keboola.snowflake-transformation",
    id: ConfigId("csas-template-merge"),
  },
  configurations: [

    if HasProjectBackend("snowflake") then {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("csas-template-merge"),
      path: "transformation/keboola.snowflake-transformation/csas-template-merge",
      rows: []
    } else if HasProjectBackend("bigquery") then {
      componentId: "keboola.google-bigquery-transformation",
      id: ConfigId("csas-template-merge"),
      path: "transformation/keboola.google-bigquery-transformation/csas-template-merge",
      rows: []
    
  ],
}

{ mainConfig: {
    componentId: "keboola.snowflake-transformation",
    id: ConfigId("csas-template-scd"),
  },
  configurations: [

    if HasProjectBackend("snowflake") then {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("csas-template-scd"),
      path: "transformation/keboola.snowflake-transformation/csas-template-scd",
      rows: []
    } else if HasProjectBackend("bigquery") then {
      componentId: "keboola.google-bigquery-transformation",
      id: ConfigId("csas-template-scd"),
      path: "transformation/keboola.google-bigquery-transformation/csas-template-scd",
      rows: []
    },
  ],
}

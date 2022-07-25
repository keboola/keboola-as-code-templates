{
  configurations: [
    {
      componentId: "keboola.ex-pipedrive",
      id: ConfigId("keboola-crm-pipedrive-data-source"),
      path: "extractor/keboola.ex-pipedrive/keboola-crm-pipedrive-data-source",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-crm-pipedrive-transformation1-input-tables-creation"),
      path: "transformation/keboola.snowflake-transformation/keboola-crm-pipedrive-transformation1-input-tables-creation",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-crm-pipedrive-transformation2-main"),
      path: "transformation/keboola.snowflake-transformation/keboola-crm-pipedrive-transformation2-main",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-crm-pipedrive-transformation3-snapshots"),
      path: "transformation/keboola.snowflake-transformation/keboola-crm-pipedrive-transformation3-snapshots",
      rows: [],
    },
  ],
}

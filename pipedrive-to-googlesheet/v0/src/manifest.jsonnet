{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("keboola-crm-pipedrive-flow"),
  },
  configurations: [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("keboola-crm-pipedrive-flow"),
      path: "other/keboola.orchestrator/keboola-crm-pipedrive-flow",
      rows: [],
    },
    {
      componentId: "keboola.ex-pipedrive",
      id: ConfigId("keboola-crm-pipedrive-data-source"),
      path: "<common>/in-crm-pipedrive/extractor/keboola.ex-pipedrive/keboola-crm-pipedrive-data-source",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-crm-pipedrive-transformation1-input-tables-creation"),
      path: "<common>/in-crm-pipedrive/transformation/keboola.snowflake-transformation/keboola-crm-pipedrive-transformation1-input-tables-creation",
      rows: [],
      metadata: {
        "KBC.configuration.folderName": "[CRM-PIPEDRIVE]"
      },
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-crm-pipedrive-transformation2-main"),
      path: "<common>/in-crm-pipedrive/transformation/keboola.snowflake-transformation/keboola-crm-pipedrive-transformation2-main",
      rows: [],
      metadata: {
        "KBC.configuration.folderName": "[CRM-PIPEDRIVE]"
      },
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("keboola-crm-pipedrive-transformation3-snapshots"),
      path: "<common>/in-crm-pipedrive/transformation/keboola.snowflake-transformation/keboola-crm-pipedrive-transformation3-snapshots",
      rows: [],
      metadata: {
        "KBC.configuration.folderName": "[CRM-PIPEDRIVE]"
      },
    },
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("out-crm-gsheet-writer"),
      path: "<common>/out-crm-gsheet/v0/src/writer/keboola.wr-google-sheets/out-crm-gsheet-writer",
      rows: [],
    },
  ],
}

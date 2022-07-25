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
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("out-crm-snowflake-writer"),
      path: "<common>/out-crm-snowflake/v0/src/writer/keboola.wr-snowflake-blob-storage/out-crm-snowflake-writer",
      rows: [
        {
          id: ConfigRowId("activity"),
          path: "rows/activity",
        },
        {
          id: ConfigRowId("company"),
          path: "rows/company",
        },
        {
          id: ConfigRowId("contact"),
          path: "rows/contact",
        },
        {
          id: ConfigRowId("employee"),
          path: "rows/employee",
        },
        {
          id: ConfigRowId("opportunity"),
          path: "rows/opportunity",
        },
        {
          id: ConfigRowId("opportunity-contact"),
          path: "rows/opportunity-contact",
        },
        {
          id: ConfigRowId("opportunity-snapshot"),
          path: "rows/opportunity-snapshot",
        },
      ],
    },
  ],
}

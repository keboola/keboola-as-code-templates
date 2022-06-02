{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("keboola-crm-hubspot-orchestration"),
  },
  configurations: [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("keboola-crm-hubspot-orchestration"),
      path: "other/keboola.orchestrator/keboola-crm-hubspot-orchestration",
      rows: [],
    },
    {
      componentId: "kds-team.ex-hubspot-crm",
      id: ConfigId("in-crm-hubspot-extractor"),
      path: "<common>/in-crm-hubspot/v0/src/extractor/kds-team.ex-hubspot-crm/in-crm-hubspot-extractor",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-hubspot-transformation1-input-tables-creation"),
      path: "<common>/in-crm-hubspot/v0/src/transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation1-input-tables-creation",
      metadata: {
        "KBC.configuration.folderName": "[CRM-HUBSPOT]"
      },
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-hubspot-transformation2-main"),
      path: "<common>/in-crm-hubspot/v0/src/transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation2-main",
      metadata: {
        "KBC.configuration.folderName": "[CRM-HUBSPOT]"
      },
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-hubspot-transformation3-snapshots"),
      path: "<common>/in-crm-hubspot/v0/src/transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation3-snapshots",
      metadata: {
        "KBC.configuration.folderName": "[CRM-HUBSPOT]"
      },
      rows: [],
    },
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("out-crm-gsheet-writer"),
      path: "<common>/out-crm-gsheet/v0/src/writer/keboola.wr-google-sheets/out-crm-gsheet-writer",
      rows: [],
    },
  ],
}

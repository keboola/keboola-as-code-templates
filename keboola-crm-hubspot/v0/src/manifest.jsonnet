{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("keboola-crm-hubspot-orchestration-7513249"),
  },
  configurations: std.filter(function(v) v != null,[
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("keboola-crm-hubspot-orchestration-7513249"),
      path: "other/keboola.orchestrator/keboola-crm-hubspot-orchestration-7513249",
      rows: [],
    },
    {
      componentId: "kds-team.ex-hubspot-crm",
      id: ConfigId("in-crm-hubspot-extractor-7513249"),
      path: "<common>/in-crm-hubspot/v0/src/extractor/kds-team.ex-hubspot-crm/in-crm-hubspot-extractor-7513249",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-hubspot-transformation1-input-tables-creation-7513249"),
      path: "<common>/in-crm-hubspot/v0/src/transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation1-input-tables-creation-7513249",
      metadata: {
        "KBC.configuration.folderName": "[KEBOOLA-CRM-HUBSPOT]"
      },
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-hubspot-transformation2-main-7513249"),
      path: "<common>/in-crm-hubspot/v0/src/transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation2-main-7513249",
      metadata: {
        "KBC.configuration.folderName": "[KEBOOLA-CRM-HUBSPOT]"
      },
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-hubspot-transformation3-snapshots-7513249"),
      path: "<common>/in-crm-hubspot/v0/src/transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation3-snapshots-7513249",
      metadata: {
        "KBC.configuration.folderName": "[KEBOOLA-CRM-HUBSPOT]"
      },
      rows: [],
    },
    if Input("google-sheet-checkbox") == true then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("out-crm-gsheet-writer-7513249"),
      path: "<common>/out-crm-gsheet/v0/src/writer/keboola.wr-google-sheets/out-crm-gsheet-writer-7513249",
      rows: [],
    },
    if InputIsAvailable("wr-snowflake-blob-storage-db-host") then
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("out-crm-snowflake-writer-7513249"),
      path: "<common>/out-crm-snowflake/v0/src/writer/keboola.wr-snowflake-blob-storage/out-crm-snowflake-writer-12706099",
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
  ]),
}

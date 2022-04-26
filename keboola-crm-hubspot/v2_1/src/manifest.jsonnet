{
  configurations: [
    {
      componentId: "kds-team.ex-hubspot-crm",
      id: ConfigId("in-crm-hubspot-extractor-7513249"),
      path: "extractor/kds-team.ex-hubspot-crm/in-crm-hubspot-extractor-7513249",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("in-crm-hubspot-orchestration-bdm-creation-7513249"),
      path: "other/keboola.orchestrator/in-crm-hubspot-orchestration-bdm-creation-7513249",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("keboola-crm-hubspot-orchestration-7513249"),
      path: "other/keboola.orchestrator/keboola-crm-hubspot-orchestration-7513249",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-hubspot-transformation1-input-tables-creation-7513249"),
      path: "transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation1-input-tables-creation-7513249",
      metadata: {
        "KBC.configuration.folderName": "[IN-CRM-HUBSPOT]"
      },
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-hubspot-transformation2-main-7513249"),
      path: "transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation2-main-7513249",
      metadata: {
        "KBC.configuration.folderName": "[IN-CRM-HUBSPOT]"
      },
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-hubspot-transformation3-snapshots-7513249"),
      path: "transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation3-snapshots-7513249",
      metadata: {
        "KBC.configuration.folderName": "[IN-CRM-HUBSPOT]"
      },
      rows: [],
    },
    if Input("google-sheet-checkbox") == true then
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("out-crm-gsheet-orchestration-bdm-usage-7513249"),
      path: "<common>/out-crm-gsheet/v0/src/other/keboola.orchestrator/out-crm-gsheet-orchestration-bdm-usage-7513249",
      rows: [],
    }
    else if std.length(Input("wr-snowflake-blob-storage-db-host")) > 0 then
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("out-crm-snowflake-orchestration-bdm-usage-7513249"),
      path: "other/keboola.orchestrator/out-crm-snowflake-orchestration-bdm-usage-7513249",
      rows: [],
    },
    if Input("google-sheet-checkbox") == true then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("out-crm-gsheet-writer-7513249"),
      path: "<common>/out-crm-gsheet/v0/src/writer/keboola.wr-google-sheets/out-crm-gsheet-writer-7513249",
      rows: [],
    }
    else if std.length(Input("wr-snowflake-blob-storage-db-host")) > 0 then
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("out-crm-snowflake-writer-7513249"),
      path: "writer/keboola.wr-snowflake-blob-storage/out-crm-snowflake-writer-7513249",
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

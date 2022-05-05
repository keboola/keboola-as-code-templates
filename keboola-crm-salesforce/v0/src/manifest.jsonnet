{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("keboola-crm-salesforce-orchestration"),
  },
  configurations: std.filter(function(v) v != null, [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("keboola-crm-salesforce-orchestration"),
      path: "other/keboola.orchestrator/keboola-crm-salesforce-orchestration",
      rows: [],
    },
    {
      componentId: "kds-team.ex-salesforce-v2",
      id: ConfigId("in-crm-salesforce-extractor"),
      path: "<common>/in-crm-salesforce/v0/src/extractor/kds-team.ex-salesforce-v2/in-crm-salesforce-extractor",
      rows: [
        {
          id: ConfigRowId("account"),
          path: "rows/account",
        },
        {
          id: ConfigRowId("contact"),
          path: "rows/contact",
        },
        {
          id: ConfigRowId("event"),
          path: "rows/event",
        },
        {
          id: ConfigRowId("lead"),
          path: "rows/lead",
        },
        {
          id: ConfigRowId("opportunity"),
          path: "rows/opportunity",
        },
        {
          id: ConfigRowId("opportunity-contact-role"),
          path: "rows/opportunity-contact-role",
        },
        {
          id: ConfigRowId("opportunity-stage"),
          path: "rows/opportunity-stage",
        },
        {
          id: ConfigRowId("user"),
          path: "rows/user",
        },
      ],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-salesforce-transformation1-input-tables-creation"),
      path: "<common>/in-crm-salesforce/v0/src/transformation/keboola.snowflake-transformation/in-crm-salesforce-transformation1-input-tables-creation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[KEBOOLA-CRM-SALESFORCE]"}
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-salesforce-transformation2-main"),
      path: "<common>/in-crm-salesforce/v0/src/transformation/keboola.snowflake-transformation/in-crm-salesforce-transformation2-main",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[KEBOOLA-CRM-SALESFORCE]"}
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-salesforce-transformation3-snapshots"),
      path: "<common>/in-crm-salesforce/v0/src/transformation/keboola.snowflake-transformation/in-crm-salesforce-transformation3-snapshots",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[KEBOOLA-CRM-SALESFORCE]"}
    },
    if Input("google-sheet-checkbox") == true then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("out-crm-gsheet-writer"),
      path: "<common>/out-crm-gsheet/v0/src/writer/keboola.wr-google-sheets/out-crm-gsheet-writer",
      rows: [],
    },
    if InputIsAvailable("wr-snowflake-blob-storage-db-host") then
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
  ],)
}

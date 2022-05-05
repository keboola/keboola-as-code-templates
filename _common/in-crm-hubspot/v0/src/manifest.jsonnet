{
  configurations: [
    {
      componentId: "kds-team.ex-hubspot-crm",
      id: ConfigId("in-crm-hubspot-extractor"),
      path: "extractor/kds-team.ex-hubspot-crm/in-crm-hubspot-extractor",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("in-crm-hubspot-orchestration-bdm-creation"),
      path: "other/keboola.orchestrator/in-crm-hubspot-orchestration-bdm-creation",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-hubspot-transformation1-input-tables-creation"),
      path: "transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation1-input-tables-creation",
      metadata: {
        "KBC.configuration.folderName": "[IN-CRM-HUBSPOT]"
      },
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-hubspot-transformation2-main"),
      path: "transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation2-main",
      metadata: {
        "KBC.configuration.folderName": "[IN-CRM-HUBSPOT]"
      },
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-hubspot-transformation3-snapshots"),
      path: "transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation3-snapshots",
      metadata: {
        "KBC.configuration.folderName": "[IN-CRM-HUBSPOT]"
      },
      rows: [],
    },
  ],
}

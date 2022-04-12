{
  configurations: [
    {
      componentId: "kds-team.ex-salesforce-v2",
      id: ConfigId("in-crm-salesforce-extractor-12706099"),
      path: "extractor/kds-team.ex-salesforce-v2/in-crm-salesforce-extractor-12706099",
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
      componentId: "keboola.orchestrator",
      id: ConfigId("in-crm-salesforce-orchestration-bdm-creation-12706099"),
      path: "other/keboola.orchestrator/in-crm-salesforce-orchestration-bdm-creation-12706099",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-salesforce-transformation1-input-tables-creation-12706099"),
      path: "transformation/keboola.snowflake-transformation/in-crm-salesforce-transformation1-input-tables-creation-12706099",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-salesforce-transformation2-main-12706099"),
      path: "transformation/keboola.snowflake-transformation/in-crm-salesforce-transformation2-main-12706099",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-salesforce-transformation3-snapshots-12706099"),
      path: "transformation/keboola.snowflake-transformation/in-crm-salesforce-transformation3-snapshots-12706099",
      rows: [],
    },
  ],
}

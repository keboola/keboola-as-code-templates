{
  configurations: [
    {
      componentId: "kds-team.ex-salesforce-v2",
      id: ConfigId("in-crm-salesforce-extractor"),
      path: "extractor/kds-team.ex-salesforce-v2/in-crm-salesforce-extractor",
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
      path: "transformation/keboola.snowflake-transformation/in-crm-salesforce-transformation1-input-tables-creation",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-salesforce-transformation2-main"),
      path: "transformation/keboola.snowflake-transformation/in-crm-salesforce-transformation2-main",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-crm-salesforce-transformation3-snapshots"),
      path: "transformation/keboola.snowflake-transformation/in-crm-salesforce-transformation3-snapshots",
      rows: [],
    },
  ],
}

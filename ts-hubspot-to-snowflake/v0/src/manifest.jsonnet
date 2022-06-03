{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("thoughtspot-crm-hubspot-orchestration"),
  },
  configurations: std.filter(function(v) v != null, [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("thoughtspot-crm-hubspot-orchestration"),
      path: "other/keboola.orchestrator/thoughtspot-crm-hubspot-orchestration",
      rows: [],
    },
    {
      componentId: "kds-team.ex-hubspot-crm",
      id: ConfigId("in-thoughtspot-hubspot-extractor"),
      path: "<common>/in-thoughtspot-hubspot/v0/src/extractor/kds-team.ex-hubspot-crm/in-thoughtspot-hubspot-extractor",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-thoughtspot-hubspot-transformation-data-preparation"),
      path: "<common>/in-thoughtspot-hubspot/v0/src/transformation/keboola.snowflake-transformation/in-thoughtspot-hubspot-transformation-data-preparation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[THOUGHTSPOT-HUBSPOT-SNOWFLAKE]"}
    },
    {
      componentId: "keboola.wr-snowflake-blob-storage",
      id: ConfigId("out-thoughtspot-hubspot-snowflake-writer"),
      path: "<common>/out-thoughtspot-hubspot-snowflake/v0/src/writer/keboola.wr-snowflake-blob-storage/out-thoughtspot-hubspot-snowflake-writer",
      rows: [
        {
          id: ConfigRowId("dim-date"),
          path: "rows/dim-date",
        },
        {
          id: ConfigRowId("hubspot-call"),
          path: "rows/hubspot-call",
        },
        {
          id: ConfigRowId("hubspot-companies"),
          path: "rows/hubspot-companies",
        },
        {
          id: ConfigRowId("hubspot-company-contact"),
          path: "rows/hubspot-company-contact",
        },
        {
          id: ConfigRowId("hubspot-contact-form-submission"),
          path: "rows/hubspot-contact-form-submission",
        },
        {
          id: ConfigRowId("hubspot-contacts"),
          path: "rows/hubspot-contacts",
        },
        {
          id: ConfigRowId("hubspot-deal-company"),
          path: "rows/hubspot-deal-company",
        },
        {
          id: ConfigRowId("hubspot-deal-contact"),
          path: "rows/hubspot-deal-contact",
        },
        {
          id: ConfigRowId("hubspot-deals"),
          path: "rows/hubspot-deals",
        },
        {
          id: ConfigRowId("hubspot-email"),
          path: "rows/hubspot-email",
        },
        {
          id: ConfigRowId("hubspot-forms"),
          path: "rows/hubspot-forms",
        },
        {
          id: ConfigRowId("hubspot-marketing-campaign-sent-date"),
          path: "rows/hubspot-marketing-campaign-sent-date",
        },
        {
          id: ConfigRowId("hubspot-marketing-email"),
          path: "rows/hubspot-marketing-email",
        },
        {
          id: ConfigRowId("hubspot-marketing-email-events"),
          path: "rows/hubspot-marketing-email-events",
        },
        {
          id: ConfigRowId("hubspot-meeting"),
          path: "rows/hubspot-meeting",
        },
        {
          id: ConfigRowId("hubspot-owner"),
          path: "rows/hubspot-owner",
        },
      ],
    },
  ],)
}

{
  configurations: [
    {
      componentId: "kds-team.ex-hubspot-crm",
      id: ConfigId("in-thoughtspot-hubspot-extractor"),
      path: "extractor/kds-team.ex-hubspot-crm/in-thoughtspot-hubspot-extractor",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("in-thoughtspot-hubspot-orchestration-bdm-creation"),
      path: "other/keboola.orchestrator/in-thoughtspot-hubspot-orchestration-bdm-creation",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("in-thoughtspot-hubspot-transformation-data-preparation"),
      path: "transformation/keboola.snowflake-transformation/in-thoughtspot-hubspot-transformation-data-preparation",
      rows: [],
    },
  ],
}

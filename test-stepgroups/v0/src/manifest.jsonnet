{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-keboola-mailchimp"),
  },
  configurations: std.filter(function(v) v != null,[
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("flow-keboola-mailchimp"),
      path: "other/keboola.orchestrator/flow-keboola-mailchimp",
      rows: [],
    },
    if InputIsAvailable("ex-mailchimp-config-password") then
    {
      componentId: "keboola.ex-mailchimp",
      id: ConfigId("data-source-1-in-mailchimp"),
      path: "<common>/in-mailchimp/extractor/keboola.ex-mailchimp/data-source-1-in-mailchimp",
      rows: [],
    },
    if InputIsAvailable("ex-mailchimp-config-password") then
    {
      componentId: "keboola.ex-mailchimp",
      id: ConfigId("data-source-2-in-mailchimp"),
      path: "<common>/in-mailchimp/extractor/keboola.ex-mailchimp/data-source-2-in-mailchimp",
      rows: [],
    },
    if InputIsAvailable("ex-hubspot-crm-private-app-token") then
    {
      componentId: "kds-team.ex-hubspot-crm",
      id: ConfigId("in-crm-hubspot-extractor"),
      path: "<common>/in-crm-hubspot/v0/src/extractor/kds-team.ex-hubspot-crm/in-crm-hubspot-extractor",
      rows: [],
    }
  ],)
}

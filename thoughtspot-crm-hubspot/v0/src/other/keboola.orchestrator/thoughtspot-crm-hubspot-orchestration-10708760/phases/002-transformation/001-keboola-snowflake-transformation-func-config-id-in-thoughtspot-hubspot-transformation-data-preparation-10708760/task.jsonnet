{
  name: "keboola.snowflake-transformation-" + ConfigId("in-thoughtspot-hubspot-transformation-data-preparation"),
  task: {
    mode: "run",
    configPath: "<common>/in-thoughtspot-hubspot/v0/src/transformation/keboola.snowflake-transformation/in-thoughtspot-hubspot-transformation-data-preparation",
  },
  continueOnFailure: false,
  enabled: true,
}

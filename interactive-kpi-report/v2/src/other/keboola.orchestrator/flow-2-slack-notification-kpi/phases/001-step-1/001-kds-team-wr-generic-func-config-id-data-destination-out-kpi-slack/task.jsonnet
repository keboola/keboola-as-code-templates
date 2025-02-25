{
  name: "kds-team.wr-generic-" + ConfigId("data-destination-out-kpi-slack"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "writer/kds-team.wr-generic/data-destination-out-kpi-slack",
  },
  continueOnFailure: false,
}

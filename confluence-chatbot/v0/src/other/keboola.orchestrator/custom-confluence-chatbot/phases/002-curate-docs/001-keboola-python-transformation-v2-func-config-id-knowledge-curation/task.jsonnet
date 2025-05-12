{
  name: "keboola.python-transformation-v2-" + ConfigId("knowledge-curation"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "transformation/keboola.python-transformation-v2/knowledge-curation",
  },
  continueOnFailure: false,
}

{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-interactive-keboola-sheets"),
  },
  configurations: [
    {
      componentId: "keboola.data-apps",
      id: ConfigId("data-app-interactive-keboola-sheets"),
      path: "app/keboola.data-apps/data-app-interactive-keboola-sheets",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("flow-interactive-keboola-sheets"),
      path: "other/keboola.orchestrator/flow-interactive-keboola-sheets",
      rows: [],
    },
  ],
}

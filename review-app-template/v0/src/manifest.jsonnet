{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("review-app-template-flow"),
  },
  configurations: [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("review-app-template-flow"),
      path: "other/keboola.orchestrator/review-app-template-flow",
      rows: [],
    },
    {
      componentId: "keboola.scheduler",
      id: ConfigId("scheduler"),
      path: "schedules/scheduler",
      relations: [
        {
          componentId: "keboola.orchestrator",
          configId: ConfigId("review-app-template-flow"),
          type: "schedulerFor"
        }
      ],
      rows: []
    },
    {
      componentId: "keboola.data-apps",
      id: ConfigId("review-generator"),
      path: "app/keboola.data-apps/review-generator",
      rows: [],
    },
    {
      componentId: "apify.apify",
      id: ConfigId("google-reviews"),
      path: "extractor/apify.apify/google-reviews",
      rows: [],
    },
  ],
}

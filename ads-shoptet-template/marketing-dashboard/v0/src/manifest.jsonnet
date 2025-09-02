{
  configurations: [
    {
      componentId: "keboola.data-apps",
      id: ConfigId("marketing-dashboard"),
      path: "app/keboola.data-apps/marketing-dashboard",
      rows: [],
    },
    {
      componentId: "kds-team.ex-shoptet-permalink",
      id: ConfigId("template-shoptet"),
      path: "extractor/kds-team.ex-shoptet-permalink/template-shoptet",
      rows: [],
    },
    {
      componentId: "keboola.ex-facebook-ads",
      id: ConfigId("template-meta"),
      path: "extractor/keboola.ex-facebook-ads/template-meta",
      rows: [],
    },
    {
      componentId: "keboola.ex-google-analytics-v4",
      id: ConfigId("template-ga"),
      path: "extractor/keboola.ex-google-analytics-v4/template-ga",
      rows: [
        {
          id: ConfigRowId("raw-ad-analytics"),
          path: "rows/raw-ad-analytics",
        },
      ],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("marketing-dashboard-001"),
      path: "other/keboola.orchestrator/marketing-dashboard-001",
      rows: [],
    },
    {
      componentId: "keboola.python-transformation-v2",
      id: ConfigId("template-marketing-metrics"),
      path: "transformation/keboola.python-transformation-v2/template-marketing-metrics",
      rows: [],
    },
  ],
}

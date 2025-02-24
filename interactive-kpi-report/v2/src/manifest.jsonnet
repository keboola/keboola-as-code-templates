{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-1-interactive-kpi-report-kpi"),
  },
  configurations: [
    {
      componentId: "keboola.data-apps",
      id: ConfigId("data-app-interactive-kpi-report-out-kpi-app"),
      path: "app/keboola.data-apps/data-app-interactive-kpi-report-out-kpi-app",
      rows: [],
    },
    {
      componentId: "kds-team.ex-shopify",
      id: ConfigId("data-source-in-kpi-shopify"),
      path: "extractor/kds-team.ex-shopify/data-source-in-kpi-shopify",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("flow-1-interactive-kpi-report-kpi"),
      path: "other/keboola.orchestrator/flow-1-interactive-kpi-report-kpi",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[KPI]"}
    },
    {
      componentId: "keboola.scheduler",
      id: ConfigId("scheduler-for-51171292"),
      path: "schedules/scheduler-for-51171292",
      relations: [
        {
          componentId: "keboola.orchestrator",
          configId: ConfigId("flow-1-interactive-kpi-report-kpi"),
          type: "schedulerFor",
        },
      ],
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("flow-2-slack-notification-kpi"),
      path: "other/keboola.orchestrator/flow-2-slack-notification-kpi",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[KPI]"}
    },

	if HasProjectBackend("snowflake") then {
	  componentId: "keboola.snowflake-transformation",
	  id: ConfigId("transformation-1-automatic-creation-of-planned-values-from-average-values-in-kpi-shopify"),
	  path: "transformation/keboola.snowflake-transformation/transformation-1-automatic-creation-of-planned-values-from-average-values-in-kpi-shopify",
	  rows: [],
	  metadata: { "KBC.configuration.folderName": "[KPI]"}
	} else if HasProjectBackend("bigquery") then {
	  componentId: "keboola.google-bigquery-transformation",
	  id: ConfigId("transformation-1-automatic-creation-of-planned-values-from-average-values-in-kpi-shopify"),
	  path: "transformation/keboola.google-bigquery-transformation/transformation-1-automatic-creation-of-planned-values-from-average-values-in-kpi-shopify",
	  rows: [],
	  metadata: { "KBC.configuration.folderName": "[KPI]"}
	},
    },

	if HasProjectBackend("snowflake") then {
	  componentId: "keboola.snowflake-transformation",
	  id: ConfigId("transformation-2-generation-of-daily-plan-from-monthly-in-kpi-shopify"),
	  path: "transformation/keboola.snowflake-transformation/transformation-2-generation-of-daily-plan-from-monthly-in-kpi-shopify",
	  rows: [],
	  metadata: { "KBC.configuration.folderName": "[KPI]"}
	} else if HasProjectBackend("bigquery") then {
	  componentId: "keboola.google-bigquery-transformation",
	  id: ConfigId("transformation-2-generation-of-daily-plan-from-monthly-in-kpi-shopify"),
	  path: "transformation/keboola.google-bigquery-transformation/transformation-2-generation-of-daily-plan-from-monthly-in-kpi-shopify",
	  rows: [],
	  metadata: { "KBC.configuration.folderName": "[KPI]"}
	},
    },

	if HasProjectBackend("snowflake") then {
	  componentId: "keboola.snowflake-transformation",
	  id: ConfigId("transformation-3-main-data-preparation-in-kpi-shopify"),
	  path: "transformation/keboola.snowflake-transformation/transformation-3-main-data-preparation-in-kpi-shopify",
	  rows: [],
	  metadata: { "KBC.configuration.folderName": "[KPI]"}
	} else if HasProjectBackend("bigquery") then {
	  componentId: "keboola.google-bigquery-transformation",
	  id: ConfigId("transformation-3-main-data-preparation-in-kpi-shopify"),
	  path: "transformation/keboola.google-bigquery-transformation/transformation-3-main-data-preparation-in-kpi-shopify",
	  rows: [],
	  metadata: { "KBC.configuration.folderName": "[KPI]"}
	},
    },
    {
      componentId: "kds-team.wr-generic",
      id: ConfigId("data-destination-out-kpi-slack"),
      path: "writer/kds-team.wr-generic/data-destination-out-kpi-slack",
      rows: [],
    },
  ],
}

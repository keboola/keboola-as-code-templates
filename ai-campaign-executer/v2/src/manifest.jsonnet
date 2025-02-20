{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("bdl-ai-marketing-shopify-twilio"),
  },
  configurations: [
    {
      componentId: "kds-team.app-generative-ai",
      id: ConfigId("generative-ai-personalise-sms-campaign"),
      path: "application/kds-team.app-generative-ai/generative-ai-personalise-sms-campaign",
      rows: [
        {
          id: ConfigRowId("shopify-campaign"),
          path: "rows/shopify-campaign",
        },
      ],
    },
    {
      componentId: "kds-team.ex-shopify",
      id: ConfigId("shopify-data-source"),
      path: "extractor/kds-team.ex-shopify/shopify-data-source",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("bdl-ai-marketing-shopify-twilio"),
      path: "other/keboola.orchestrator/bdl-ai-marketing-shopify-twilio",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[AI-CAMPAIGN-EXECUTER]"}
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("twilio-campaign-sender-trigger"),
      path: "other/keboola.orchestrator/twilio-campaign-sender-trigger",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[AI-CAMPAIGN-EXECUTER]"}
    },

    if HasProjectBackend("snowflake") then {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("shopify-data-prep-for-ai"),
      path: "transformation/keboola.snowflake-transformation/shopify-data-prep-for-ai",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[AI-CAMPAIGN-EXECUTER]"}
    } else if HasProjectBackend("bigquery") then {
      componentId: "keboola.google-bigquery-transformation",
      id: ConfigId("shopify-data-prep-for-ai"),
      path: "transformation/keboola.google-bigquery-transformation/shopify-data-prep-for-ai",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[AI-CAMPAIGN-EXECUTER]"}
    },
    },

    if HasProjectBackend("snowflake") then {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("twilio-sms-data-preparation"),
      path: "transformation/keboola.snowflake-transformation/twilio-sms-data-preparation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[AI-CAMPAIGN-EXECUTER]"}
    } else if HasProjectBackend("bigquery") then {
      componentId: "keboola.google-bigquery-transformation",
      id: ConfigId("twilio-sms-data-preparation"),
      path: "transformation/keboola.google-bigquery-transformation/twilio-sms-data-preparation",
      rows: [],
      metadata: { "KBC.configuration.folderName": "[AI-CAMPAIGN-EXECUTER]"}
    },
    },
    {
      componentId: "kds-team.wr-twilio",
      id: ConfigId("twilio-campaign-maker"),
      path: "writer/kds-team.wr-twilio/twilio-campaign-maker",
      rows: [],
    },
    {
      componentId: "keboola.scheduler",
      id: ConfigId("scheduler-for"),
      path: "schedules/scheduler-for",
      relations: [
        {
          componentId: "keboola.orchestrator",
          configId: ConfigId("bdl-ai-marketing-shopify-twilio"),
          type: "schedulerFor",
        },
      ],
      rows: [],
    },
    {
      componentId: "keboola.data-apps",
      id: ConfigId("data-app-ai-campaign-executer"),
      path: "app/keboola.data-apps/data-app-ai-campaign-executer",
      rows: [],
    },
  ],
}

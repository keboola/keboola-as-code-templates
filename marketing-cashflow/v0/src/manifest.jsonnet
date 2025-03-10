{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("ads-spend-vs-budget-ads-spend-vs-budget-tracker"),
  },
  configurations: std.filter(function(v) v != null,[
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("ads-spend-vs-budget-ads-spend-vs-budget-tracker"),
      path: "other/keboola.orchestrator/ads-spend-vs-budget-ads-spend-vs-budget-tracker",
      rows: [],
    },
    {
      componentId: "keboola.data-apps",
      id: ConfigId("ads-spend-vs-budget-app-ads-spend-vs-budget-tracker"),
      path: "app/keboola.data-apps/ads-spend-vs-budget-app-ads-spend-vs-budget-tracker",
      rows: [],
    },
    if InputIsAvailable("oauth-tiktok") then
    {
      componentId: "kds-team.ex-tiktok-ads",
      id: ConfigId("tik-tok-campaigns-ads-spend-vs-budget-tracker"),
      path: "extractor/kds-team.ex-tiktok-ads/tik-tok-campaigns-ads-spend-vs-budget-tracker",
      rows: [
        {
          id: ConfigRowId("ad"),
          path: "rows/ad",
        },
        {
          id: ConfigRowId("adgroup"),
          path: "rows/adgroup",
        },
        {
          id: ConfigRowId("campaign"),
          path: "rows/campaign",
        },
      ],
    },
    if InputIsAvailable("ex-sklik-token") || InputIsAvailable("oauth-googleads") then
    {
      componentId: "keboola.ex-currency",
      id: ConfigId("ecb-currency-rates-ads-spend-vs-budget-tracker"),
      path: "extractor/keboola.ex-currency/ecb-currency-rates-ads-spend-vs-budget-tracker",
      rows: [],
    },
    if InputIsAvailable("oauth-facebookads") then
    {
      componentId: "keboola.ex-facebook-ads",
      id: ConfigId("meta-campaigns-ads-spend-vs-budget-tracker"),
      path: "extractor/keboola.ex-facebook-ads/meta-campaigns-ads-spend-vs-budget-tracker",
      rows: [],
    },
    if InputIsAvailable("oauth-googleads") then
    {
      componentId: "keboola.ex-google-ads",
      id: ConfigId("google-campaigns-ads-spend-vs-budget-tracker"),
      path: "extractor/keboola.ex-google-ads/google-campaigns-ads-spend-vs-budget-tracker",
      rows: [
        {
          id: ConfigRowId("ads"),
          path: "rows/ads",
        },
        {
          id: ConfigRowId("report-ad-group"),
          path: "rows/report-ad-group",
        },
        {
          id: ConfigRowId("report-campaign"),
          path: "rows/report-campaign",
        },
      ],
    },
    if InputIsAvailable("ex-sklik-token") then
    {
      componentId: "keboola.ex-sklik",
      id: ConfigId("sklik-campaigns-ads-spend-vs-budget-tracker"),
      path: "extractor/keboola.ex-sklik/sklik-campaigns-ads-spend-vs-budget-tracker",
      rows: [],
    },
    if InputIsAvailable("ex-linkedin-start-day") then
    {
      componentId: "leochan.ex-linkedin",
      id: ConfigId("linked-in-campaigns-ads-spend-vs-budget-tracker"),
      path: "extractor/leochan.ex-linkedin/linked-in-campaigns-ads-spend-vs-budget-tracker",
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("campaign-budget-table-preparation-ads-spend-vs-budget-tracker"),
      path: "transformation/keboola.snowflake-transformation/campaign-budget-table-preparation-ads-spend-vs-budget-tracker",
      metadata: {
        "KBC.configuration.folderName": "[MARKETING-CASHFLOW]",
      },
      rows: [],
    },
    if InputIsAvailable("oauth-googleads") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("google-ads-campaign-data-cleaning-ads-spend-vs-budget-tracker"),
      path: "transformation/keboola.snowflake-transformation/google-ads-campaign-data-cleaning-ads-spend-vs-budget-tracker",
      metadata: {
        "KBC.configuration.folderName": "[MARKETING-CASHFLOW]",
      },
      rows: [],
    },
    if InputIsAvailable("ex-linkedin-start-day") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("linked-in-campaign-data-cleaning-ads-spend-vs-budget-tracker"),
      path: "transformation/keboola.snowflake-transformation/linked-in-campaign-data-cleaning-ads-spend-vs-budget-tracker",
      metadata: {
        "KBC.configuration.folderName": "[MARKETING-CASHFLOW]",
      },
      rows: [],
    },
    if InputIsAvailable("oauth-facebookads") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("meta-campaign-data-cleaning-ads-spend-vs-budget-tracker"),
      path: "transformation/keboola.snowflake-transformation/meta-campaign-data-cleaning-ads-spend-vs-budget-tracker",
      metadata: {
        "KBC.configuration.folderName": "[MARKETING-CASHFLOW]",
      },
      rows: [],
    },
    if InputIsAvailable("ex-sklik-token") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("sklik-campaign-data-cleaning-ads-spend-vs-budget-tracker"),
      path: "transformation/keboola.snowflake-transformation/sklik-campaign-data-cleaning-ads-spend-vs-budget-tracker",
      metadata: {
        "KBC.configuration.folderName": "[MARKETING-CASHFLOW]",
      },
      rows: [],
    },
    if InputIsAvailable("oauth-tiktok") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("tik-tok-campaign-data-cleaning-ads-spend-vs-budget-tracker"),
      path: "transformation/keboola.snowflake-transformation/tik-tok-campaign-data-cleaning-ads-spend-vs-budget-tracker",
      metadata: {
        "KBC.configuration.folderName": "[MARKETING-CASHFLOW]",
      },
      rows: [],
    },
  ],)
}

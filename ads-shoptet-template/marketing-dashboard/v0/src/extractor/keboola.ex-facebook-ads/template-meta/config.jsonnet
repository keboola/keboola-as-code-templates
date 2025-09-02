{
  parameters: {
    accounts: {},
    "api-version": "v22.0",
    queries: [
      {
        id: 77477,
        type: "nested-query",
        name: "ad_costs",
        "run-by-id": false,
        query: {
          path: "ads",
          fields: "id,name,account_id,adset_id,adset{name},campaign_id,campaign{name},\ninsights.time_increment(1){ad_id,ad_name,spend,account_currency,date_start,date_stop,impressions,clicks}\n",
          ids: "",
          limit: "25",
          since: Input("ex-facebook-ads-since"),
          until: Input("ex-facebook-ads-until"),
        },
      },
    ],
  },
  storage: {
    output: {
      default_bucket: "in.c-Meta-" + ConfigId("template-meta"),
    },
  },
}

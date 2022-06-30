{
  parameters: {
    accounts: {
    },
    "api-version": Input("ex-facebook-ads-api-version"),
    queries: [
      {
        id: 25200,
        type: "nested-query",
        name: "facebook_ads_insights_last_90d",
        query: {
          path: "",
          fields: "insights.level(ad).action_breakdowns(action_type).date_preset(last_90d).time_increment(1){ad_id,ad_name,impressions,reach,clicks,spend}",
          ids: "",
          limit: "5",
        },
      },
      {
        id: 67799,
        type: "nested-query",
        name: "facebook_ads_insights_monthly",
        query: {
          path: "",
          fields: "insights.level(ad).action_breakdowns(action_type).date_preset(maximum).time_increment(monthly){ad_id,ad_name,impressions,reach,clicks,spend}",
          ids: "",
          limit: "25",
        },
      },
    ],
  },
  processors: {
    after: [
      {
        definition: {
          component: "keboola.processor-create-empty-table",
        },
        parameters: {
          tables: [
            {
              tableName: "facebook_ads_insights_monthly_insights",
              columns: [
                "ex_account_id",
                "fb_graph_node",
                "parent_id",
                "ad_id",
                "ad_name",
                "clicks",
                "date_start",
                "date_stop",
                "impressions",
                "reach",
                "spend",
              ],
            },
            {
              tableName: "facebook_ads_insights_last_90d_insights",
              columns: [
                "ex_account_id",
                "fb_graph_node",
                "parent_id",
                "ad_id",
                "ad_name",
                "clicks",
                "date_start",
                "date_stop",
                "impressions",
                "reach",
                "spend",
              ],
            },
          ],
        },
      },
    ],
  },
  authorization: {
    oauth_api: Input("g3s2-oauth-facebookads"),
  },
}

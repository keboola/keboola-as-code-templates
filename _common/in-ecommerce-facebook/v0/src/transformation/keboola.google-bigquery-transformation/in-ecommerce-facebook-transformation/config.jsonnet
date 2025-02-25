{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-facebook-ads-" + ConfigId("in-ecommerce-facebook-extractor") + ".facebook_ads_insights_last_90d_insights",
          destination: "facebook_ads_insights_last_90d_insights",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-facebook-ads-" + ConfigId("in-ecommerce-facebook-extractor") + ".facebook_ads_insights_monthly_insights",
          destination: "facebook_ads_insights_monthly_insights",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_marketing_campaign_costs",
          source: "bdm_marketing_campaign_costs",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "MARKETING_CAMPAIGN_COSTS_ID",
          ],
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_marketing_campaign_costs_monthly",
          source: "bdm_marketing_campaign_costs_monthly",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "MARKETING_CAMPAIGN_COSTS_ID",
          ],
        },
      ],
    },
  },
}

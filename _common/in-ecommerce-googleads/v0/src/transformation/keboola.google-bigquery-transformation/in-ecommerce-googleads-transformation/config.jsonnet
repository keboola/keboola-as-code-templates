{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-google-ads-" + ConfigId("in-ecommerce-googleads-extractor") + ".report-campaign",
          destination: "report-campaign",
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
          primary_key: [
            "MARKETING_CAMPAIGN_COSTS_ID",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_marketing_campaign_costs_monthly",
          source: "bdm_marketing_campaign_costs_monthly",
          primary_key: [
            "MARKETING_CAMPAIGN_COSTS_ID",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
      ],
    },
  },
}

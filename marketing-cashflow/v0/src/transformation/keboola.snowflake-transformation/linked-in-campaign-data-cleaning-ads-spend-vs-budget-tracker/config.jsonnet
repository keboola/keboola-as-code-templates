{
  parameters: {},
  storage: {
    output: {
      tables: [
        {
          destination: "out.c-Marketing_cash_flow.ads_insight_fact",
          source: "ads_insight_fact",
          primary_key: [
            "src_id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
      ],
    },
    input: {
      tables: [
        {
          source: "in.c-leochan-ex-linkedin-" + ConfigId("linked-in-campaigns-ads-spend-vs-budget-tracker") + ".accounts",
          destination: "linkedin_accounts",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-leochan-ex-linkedin-" + ConfigId("linked-in-campaigns-ads-spend-vs-budget-tracker") + ".ads_basic_stats",
          destination: "linkedin_ads_basic_stats",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-leochan-ex-linkedin-" + ConfigId("linked-in-campaigns-ads-spend-vs-budget-tracker") + ".ads_cost",
          destination: "linkedin_ads_cost",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-leochan-ex-linkedin-" + ConfigId("linked-in-campaigns-ads-spend-vs-budget-tracker") + ".campaign_groups",
          destination: "linkedin_campaign_groups",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-leochan-ex-linkedin-" + ConfigId("linked-in-campaigns-ads-spend-vs-budget-tracker") + ".campaigns",
          destination: "linkedin_campaigns",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
      ],
    },
  },
}

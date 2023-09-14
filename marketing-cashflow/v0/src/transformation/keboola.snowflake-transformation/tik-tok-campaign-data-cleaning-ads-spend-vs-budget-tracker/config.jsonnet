{
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-tiktok-ads-" + ConfigId("tik-tok-campaigns-ads-spend-vs-budget-tracker") + ".TIKTOK_AD",
          destination: "tiktok_ad",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-tiktok-ads-" + ConfigId("tik-tok-campaigns-ads-spend-vs-budget-tracker") + ".TIKTOK_ADGROUP",
          destination: "tiktok_adgroup",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-tiktok-ads-" + ConfigId("tik-tok-campaigns-ads-spend-vs-budget-tracker") + ".TIKTOK_CAMPAIGN",
          destination: "tiktok_campaign",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
      ],
    },
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
  },
  parameters: {},
}

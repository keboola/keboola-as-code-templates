{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-sklik-" + ConfigId("in-ecommerce-sklik-extractor-6031007") + ".accounts",
          destination: "accounts",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-sklik-" + ConfigId("in-ecommerce-sklik-extractor-6031007") + ".sklik-campaigns",
          destination: "sklik-campaigns",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-sklik-" + ConfigId("in-ecommerce-sklik-extractor-6031007") + ".sklik-campaigns-monthly",
          destination: "sklik-campaigns-monthly",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-sklik-" + ConfigId("in-ecommerce-sklik-extractor-6031007") + ".sklik-campaigns-monthly-stats",
          destination: "sklik-campaigns-monthly-stats",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-sklik-" + ConfigId("in-ecommerce-sklik-extractor-6031007") + ".sklik-campaigns-stats",
          destination: "sklik-campaigns-stats",
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
          destination: "out.c-ecommerce-wr-" + ConfigId("in-ecommerce-sklik-extractor-6031007") + ".bdm_marketing_campaign_costs",
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
          destination: "out.c-ecommerce-wr-" + ConfigId("in-ecommerce-sklik-extractor-6031007") + ".bdm_marketing_campaign_costs_monthly",
          primary_key: [
            "MARKETING_CAMPAIGN_COSTS_ID",
          ],
          source: "bdm_marketing_campaign_costs_monthly",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
      ],
    },
  },
}

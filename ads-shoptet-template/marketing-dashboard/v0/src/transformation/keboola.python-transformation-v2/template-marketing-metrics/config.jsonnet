{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-GoogleAnalytics-" + ConfigId("template-ga") + ".raw_ad_analytics",
          destination: "raw_ad_analytics.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-Meta-" + ConfigId("template-meta") + ".ad_costs_insights",
          destination: "ad_costs_insights.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-Shoptet-" + ConfigId("template-shoptet") + ".orders",
          destination: "orders.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-Shoptet-" + ConfigId("template-shoptet") + ".products",
          destination: "products.csv",
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
          destination: "out.c-marketing_metrics.marketing_metrics",
          source: "marketing_metrics.csv",
        },
      ],
    },
  },
}

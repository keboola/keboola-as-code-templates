{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("data-source-in-kpi-shopify") + ".customer",
          destination: "customer",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("data-source-in-kpi-shopify") + ".order",
          destination: "order",
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
          destination: "out.c-kpi-report-" + InstanceIdShort() + ".plan_monthly",
          source: "out_plan_monthly",
        },
      ],
    },
  },
}

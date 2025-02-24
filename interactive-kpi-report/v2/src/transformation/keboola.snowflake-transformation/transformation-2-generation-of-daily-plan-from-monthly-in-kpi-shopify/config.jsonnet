{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "out.c-kpi-report-" + InstanceIdShort() + ".plan_monthly",
          destination: "plan_monthly",
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
          destination: "out.c-kpi-report-" + InstanceIdShort() + ".plan_daily",
          source: "out_plan_daily",
        },
      ],
    },
  },
}

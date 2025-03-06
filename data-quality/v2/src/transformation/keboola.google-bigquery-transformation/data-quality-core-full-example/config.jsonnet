{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "out.c-fake-data.orders",
          destination: "orders",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-fake-data.customers",
          destination: "customers",
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
          destination: "out.c-DATA_QUALITY_CORE.DQ_RESULTS_LOG",
          source: "DQ_RESULTS_LOG",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "ID",
          ],
        },
      ],
    },
  },
  shared_code_path: "_shared/keboola.google-bigquery-transformation",
}

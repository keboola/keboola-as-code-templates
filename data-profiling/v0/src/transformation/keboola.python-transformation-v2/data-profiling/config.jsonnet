{
  parameters: {
    packages: [
      "openai",
      "pandas",
      "numpy<2",
      "pathlib",
      "datetime",
      "scikit-learn",
      "pyarrow"
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: Input("table-id"),
          destination: Input("table-name") + ".csv",
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
          destination: "out.c-data-profiling-output.results",
          source: "results",
        },
      ],
    },
  },
  runtime: {
    backend: {
      type: "small",
    },
  },
}

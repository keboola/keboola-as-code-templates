{
  parameters: {
    dataApp: {
      git: {
        repository: "https://TBD",
        branch: "main",
        entrypoint: "streamlit_app.py",
      },
      secrets: {
        KEBOOLA_URL: Input("kbc_stack"),
        "#KEBOOLA_STORAGE_TOKEN": Input("kbc_storage_token"),
      },
    },
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-kpi-report-" + InstanceIdShort() + ".shopify_metrics",
          destination: "shopify_metrics.csv",
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

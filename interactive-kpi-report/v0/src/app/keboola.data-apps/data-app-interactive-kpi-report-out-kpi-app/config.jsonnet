{
  parameters: {
    dataApp: {
      streamlitAuthEnabled: true,
      git: {
        repository: "https://github.com/keboola/interactive-kpi-reporting",
        branch: "main",
        entrypoint: "streamlit_app.py",
      },
      secrets: {
        "#kbc_storage_token": Input("kbc_storage_token"),
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
  authorization: {
    app_proxy: {
      auth_providers: [],
      auth_rules: [
        {
          type: "pathPrefix",
          value: "/",
          auth_required: false
        }
      ]
    }
  }
}

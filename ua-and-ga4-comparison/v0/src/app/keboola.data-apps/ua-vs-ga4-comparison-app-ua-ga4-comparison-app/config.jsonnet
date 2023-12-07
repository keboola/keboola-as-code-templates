{
  parameters: {
    dataApp: {
      streamlitAuthEnabled: true,
      git: {
        repository: "https://github.com/keboola/ua-ga4-comparison",
        branch: "main",
        entrypoint: "main_app.py",
      }
    }
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-comparision-ua-vs-ga4" + InstanceIdShort() + ".COMPARISON",
          destination: "COMPARISON.csv",
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

{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing",
          columns: [],
          destination: "online_marketing.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          keep_internal_timestamp_column: false
        }
      ]
    }
  },
  parameters: {
    dataApp: {
      streamlitAuthEnabled: true,
      git: {
        branch: "main",
        entrypoint: "online_marketing.py",
        repository: "https://github.com/keboola/marketing-dashboard-data-app.git"
      }
    }
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

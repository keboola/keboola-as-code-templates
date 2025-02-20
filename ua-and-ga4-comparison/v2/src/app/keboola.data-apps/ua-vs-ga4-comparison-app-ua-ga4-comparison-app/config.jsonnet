{
  parameters: {
    dataApp: {
      slug: "ua-ga4-comparison",
      streamlit: {
        "config.toml": '[theme]\nthemeName = "keboola"\nfont = "sans serif"\ntextColor = "#222529"\nbackgroundColor = "#FFFFFF"\nprimaryColor = "#1F8FFF"',
      },
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
  authorization: {
    app_proxy: {
      auth_providers: [
        {
          id: "simpleAuth",
          type: "password"
        }
      ],
      auth_rules: [
        {
          type: "pathPrefix",
          value: "/",
          auth_required: true,
          auth: [
            "simpleAuth"
          ]
        }
      ]
    }
  }
}

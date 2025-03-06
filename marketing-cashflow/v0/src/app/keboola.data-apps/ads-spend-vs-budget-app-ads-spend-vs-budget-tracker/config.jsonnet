{
  parameters: {
    dataApp: {
      slug: "ads-spend-vs-budget-tracker",
      streamlit: {
        "config.toml": '[theme]\nthemeName = "keboola"\nfont = "sans serif"\ntextColor = "#222529"\nbackgroundColor = "#FFFFFF"\nprimaryColor = "#1F8FFF"',
      },
      git: {
        repository: "https://TBD.git",
        branch: "main",
        entrypoint: "app.py",
        private: false,
      },
      secrets: {
        "#kec_storage_token": Input("kbc-storage-token"),
      },
    }
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-Marketing_cash_flow.ads_insight_fact",
          destination: "ads_insight_fact.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "out.c-Marketing_cash_flow.campaign_budget",
          destination: "campaign_budget.csv",
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

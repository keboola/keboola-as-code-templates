{
  parameters: {
    size: "tiny",
    autoSuspendAfterSeconds: 900,
    dataApp: {
      slug: "marketing-dashboard",
      streamlit: {
        "config.toml": '[theme]\nfont = "sans serif"\ntextColor = "#222529"\nbackgroundColor = "#FFFFFF"\nsecondaryBackgroundColor = "#E6F2FF"\nprimaryColor = "#1F8FFF"',
      },
      git: {
        repository: "https://github.com/ottomansky/Keboola---Shoptet-Ads-Sales-Dashboard",
        branch: "main",
        entrypoint: "app.py",
      },
    },
    id: "31996171",
  },
  authorization: {
    app_proxy: {
      auth_providers: [
        {
          id: "simpleAuth",
          type: "password",
        },
      ],
      auth_rules: [
        {
          type: "pathPrefix",
          value: "/",
          auth_required: true,
          auth: [
            "simpleAuth",
          ],
        },
      ],
    },
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-marketing_metrics.marketing_metrics",
          destination: "marketing_metrics.csv",
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

{
  parameters: {
    dataApp: {
      slug: "interactive-data-app",
      streamlit: {
        "config.toml": '[theme]\nthemeName = "keboola"\nfont = "sans serif"\ntextColor = "#222529"\nbackgroundColor = "#FFFFFF"\nprimaryColor = "#1F8FFF"',
      },
      git: {
        branch: "master",
        entrypoint: "main.py",
        repository: "https://github.com/aalteirac/streamlit_keboola_vhol_pc.git"
      },
      secrets: {
        user: Input("wr-snowflake-db-user"),
        "#password": Input("wr-snowflake-db-password"),
        account: Input("data-app-secrets-account-identifier"),
        warehouse: Input("wr-snowflake-db-warehouse"),
        db_name: Input("wr-snowflake-db-database"),
        schema_name: Input("wr-snowflake-db-schema"),
        keboola_key: Input("data-app-secrets-keboola-token")
      }
    }
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

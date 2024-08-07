{
  parameters: {
    dataApp: {
      slug: "newsletters-data-app",
      streamlitAuthEnabled: false,
      streamlit: {
        "config.toml": '[theme]\nthemeName = "keboola"\nfont = "sans serif"\ntextColor = "#222529"\nbackgroundColor = "#FFFFFF"\nprimaryColor = "#1F8FFF"',
      },
      git: {
        repository: "https://github.com/keboola/data-app-newsletter-personalizer",
        branch: "main",
        entrypoint: "nl_app.py",
      },
      secrets: {
        "#api_key": Input("openai-api-token"),
        "#storage_token": Input("kbc_storage_token"),
        url: Input("keboola-account-url"),
      },
    }
  },
  authorization: {
    app_proxy: {
      auth_providers: [],
      auth_rules: [
        {
          type: "pathPrefix",
          value: "/",
          auth_required: false,
        },
      ],
    },
  },
}

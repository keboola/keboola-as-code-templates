{
  parameters: {
    dataApp: {
      slug: "rlhf-data-app",
      streamlitAuthEnabled: false,
      streamlit: {
        "config.toml": '[theme]\nthemeName = "keboola"\nfont = "sans serif"\ntextColor = "#222529"\nbackgroundColor = "#FFFFFF"\nprimaryColor = "#1F8FFF"',
      },
      secrets: {
        "#api_key": Input("openai-api-token"),
        "#admin": Input("user-login"),
      },
      git: {
        repository: "https://github.com/keboola/data-app-rhlf",
        entrypoint: "rlhf_app.py",
        branch: "main",
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

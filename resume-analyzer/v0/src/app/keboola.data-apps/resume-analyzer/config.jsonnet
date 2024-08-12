{
  parameters: {
    dataApp: {
      slug: "cv-ranker-data-app",
      streamlit: {
        "config.toml": '[theme]\nthemeName = "keboola"\nfont = "sans serif"\ntextColor = "#222529"\nbackgroundColor = "#FFFFFF"\nprimaryColor = "#1F8FFF"',
      },
      secrets: {
        "#openai_token": Input("data-apps-data-app-secrets-openai-token"),
        "#lever_token": Input("data-apps-data-app-secrets-lever-token"),
      },
      git: {
        repository: "https://github.com/keboola/data-app-cv-ranker",
        branch: "main",
        entrypoint: "streamlit_app.py",
      },
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
    },
  },
}

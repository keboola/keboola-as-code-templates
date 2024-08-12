{
  parameters: {
    dataApp: {
      slug: "hello-world-data-app",
      streamlit: {
        "config.toml": '[theme]\nthemeName = "keboola"\nfont = "sans serif"\ntextColor = "#222529"\nbackgroundColor = "#FFFFFF"\nprimaryColor = "#1F8FFF"',
      },
      secrets: {
        "#PINECONE_API_KEY": Input("wr-pinecone-authentication-pinecone-api-key"),
        PINECONE_ENV: Input("wr-pinecone-authentication-pinecone-environment"),
        "#OPENAI_API_KEY": Input("wr-pinecone-authentication-openai-api-key"),
      },
      git: {
        repository: "https://github.com/keboola/kai_slack_bot",
        branch: "streamlit-app",
        entrypoint: "streamlit_app.py",
      },
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

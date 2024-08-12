{
  parameters: {
    dataApp: {
      slug: "review-generator",
      streamlit: {
        "config.toml": '[theme]\nthemeName = "keboola"\nfont = "sans serif"\ntextColor = "#222529"\nbackgroundColor = "#FFFFFF"\nprimaryColor = "#1F8FFF"',
      },
      git: {
        repository: "https://github.com/keboola/data-app-review-generator",
        branch: "main",
        entrypoint: "streamlit_app.py",
      },
      secrets: {
        "#openai_token": Input("openai-token"),
		    apify_table: "in.c-apify-apify-" + ConfigId("google-reviews") + ".dataset-items",
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
    },
  },
}

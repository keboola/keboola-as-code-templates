{
  parameters: {
    dataApp: {
      streamlitAuthEnabled: true,
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
        "#keboola_token": Input("keboola-storage-token"),
		"google_table": "in.c-apify-apify-"+ConfigId("google-reviews") + ".dataset-items",
      },
    },
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

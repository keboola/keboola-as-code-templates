{
  parameters: {
    dataApp: {
      streamlitAuthEnabled: true,
      git: {
        repository: "https://github.com/keboola/planning-sheets-data-app/",
        branch: "main",
        entrypoint: "streamlit_app.py",
      },
      secrets: {
        "#kbc_storage_token": Input("kbc_storage_token"),
      },
      slug: "keboola-data-editor-demo",
    },
  },
  authorization: {
    app_proxy: {
      auth_providers: [],
      auth_rules: [
        {
          type: "pathPrefix",
          value: "/",
          auth_required: false
        }
      ]
    }
  }
}
{
  parameters: {
    dataApp: {
      streamlitAuthEnabled: false,
      git: {
        repository: "https://github.com/keboola/kai-promptlab",
        branch: "main",
        entrypoint: "PromptLab.py",
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
          auth_required: false
        }
      ]
    }
  }
}

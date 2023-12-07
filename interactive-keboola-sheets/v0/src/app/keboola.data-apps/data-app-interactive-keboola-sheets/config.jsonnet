{
  parameters: {
    dataApp: {
      streamlitAuthEnabled: true,
      git: {
        repository: "https://github.com/keboola/planning-sheets-data-app/",
        branch: "main",
        entrypoint: "plan_data_editor.py",
      },
      secrets: {
        "#kbc_storage_token": Input("kbc_storage_token"),
      },
    },
  },
}

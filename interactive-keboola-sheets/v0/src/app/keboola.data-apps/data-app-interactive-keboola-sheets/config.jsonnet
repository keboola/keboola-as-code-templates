{
  parameters: {
    dataApp: {
      git: {
        repository: "https://github.com/keboola/planning-sheets-data-app/",
        branch: "main",
        entrypoint: "plan_data_editor.py",
      },
      secrets: {
        "#kbc_bucket_token": Input("kbc_storage_token"),
      },
    },
  },
}

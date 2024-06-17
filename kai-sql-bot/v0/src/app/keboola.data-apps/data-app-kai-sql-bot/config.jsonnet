{
  parameters: {
    dataApp: {
      streamlitAuthEnabled: true,
      git: {
        repository: "https://github.com/keboola/Kai-SQL-bot",
        branch: "main",
        entrypoint: "app.py",
      },
      secrets: {
        warehouse_name: Input("data-apps-data-app-secrets-warehouse-name"),
        schema_name: Input("data-apps-data-app-secrets-schema-name"),
        user: Input("data-apps-data-app-secrets-role-name"),
        database_name: Input("data-apps-data-app-secrets-database-name"),
        "#OPENAI_API_KEY": Input("data-apps-data-app-secrets-openai-api-key"),
        account_identifier: Input("data-apps-data-app-secrets-account-identifier"),
        "#password": Input("data-apps-data-app-secrets-password"),
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

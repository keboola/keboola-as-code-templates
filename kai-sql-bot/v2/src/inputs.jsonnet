{
  stepsGroups: [
    {
      description: "Kai SQL bot",
      required: "all",
      steps: [
        {
          icon: "component:keboola.data-apps",
          name: "Kai SQL bot",
          description: "Configure Data App",
          dialogName: "Configure Kai SQL bot", 
          dialogDescription: "Insert values for all parameters below so the data app will work correctly.",
          inputs: [
            {
              id: "data-apps-data-app-secrets-account-identifier",
              name: "Account Identifier",
              description: "Insert your project location.",
              type: "string",
              kind: "input",
              default: "keboola.west-europe.azure",
            },
            {
              id: "data-apps-data-app-secrets-openai-api-key",
              name: "OpenAI API Key",
              description: "Insert you OpenAI API Key.",
              type: "string",
              kind: "hidden",
            },
            {
              id: "data-apps-data-app-secrets-warehouse-name",
              name: "Database Warehouse Name",
              description: "Insert a database  warehouse name.",
              type: "string",
              kind: "input",
              default: "KEBOOLA_PROD",
            },
            {
              id: "data-apps-data-app-secrets-database-name",
              name: "Database Name",
              description: "Insert your database name.",
              type: "string",
              kind: "input",
              default: "KEBOOLA_XXXXX",
            },
            {
              id: "data-apps-data-app-secrets-schema-name",
              name: "Schema Name",
              description: "Insert a database schema name.",
              type: "string",
              kind: "input",
              default: "WORKSPACE_XXXXXXX",
            },
            {
              id: "data-apps-data-app-secrets-role-name",
              name: "User Name",
              description: "Insert an account/user name to the database.",
              type: "string",
              kind: "input",
              default: "KEBOOLA_WORKSPACE_XXXXXXXX",
            },
            {
              id: "data-apps-data-app-secrets-password",
              name: "Database Password",
              description: "Insert your password into Snowflake database.",
              type: "string",
              kind: "hidden",
            }
          ],
        },
      ],
    },
  ],
}

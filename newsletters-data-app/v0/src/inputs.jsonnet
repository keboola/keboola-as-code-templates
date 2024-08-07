{
  stepsGroups: [
        {
      description: "Data App",
      required: "all",
      steps: [
        {
          icon: "component:keboola.data-apps",
          name: "Newsletter Data App",
          description: "Configure Data App",
          dialogName: "Set up Newsletter", 
          dialogDescription: "Configure Data App by filling up required secrets.",
          inputs: [
            {
              id: "openai-api-token",
              name: "OpenAI API Key",
              description: "Insert your token to OpenAI account.",
              type: "string",
              kind: "hidden",
              rules: "required"
            },
            {
              id: "kbc_storage_token",
              name: "Keboola Token",
              description: "Insert a storage or your master token.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "keboola-account-url",
              name: "Keboola Account Url",
              description: "Insert your project location.",
              type: "string",
              kind: "input",
              default: "https://connection.keboola.com/",
            },
          ],
        },
      ],
    },
  ],
}

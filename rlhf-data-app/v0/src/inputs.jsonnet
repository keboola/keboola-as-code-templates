{
  stepsGroups: [
        {
      description: "Data App",
      required: "all",
      steps: [
        {
          icon: "component:keboola.data-apps",
          name: "RLHF Data App",
          description: "Configure Data App",
          dialogName: "Set up RLHF Data App", 
          dialogDescription: "Configure Data App by filling up required secrets.",
          inputs: [
            {
              id: "user-login",
              name: "User Login",
              description: "",
              type: "string",
              kind: "hidden",
            },
            {
              id: "openai-api-token",
              name: "OpenAI API Key",
              description: "Insert your token to OpenAI account.",
              type: "string",
              kind: "hidden",
              rules: "required"
            },
          ],
        },
      ],
    },
  ],
}

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
          ],
        },
      ],
    },
  ],
}

{
  stepsGroups: [
        {
      description: "Data App",
      required: "all",
      steps: [
        {
          icon: "component:keboola.data-apps",
          name: "Review Generator",
          description: "Configure Data App",
          dialogName: "Set up Resume Analyzer", 
          dialogDescription: "Configure Data App by filling up required secrets.",
          inputs: [
            {
              id: "data-apps-data-app-secrets-lever-token",
              name: "Lever token",
              description: "",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "data-apps-data-app-secrets-openai-token",
              name: "OpenAI token",
              description: "Insert token to your OpenAI account.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
          ],
        },
      ],
    },
  ],
}

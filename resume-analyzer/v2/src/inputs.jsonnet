{
  stepsGroups: [
    {
      description: "Data Source",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-lever",
          name: "Lever",
          description: "Lever - Data Source",
          dialogName: "Lever Data Source", 
          dialogDescription: "Configure Data Source by filling up required inputs.",
          inputs: [
            {
              id: "ex-lever-authentication-token",
              name: "Lever token",
              description: "Insert token to your Lever account",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
          ],
        },
      ],
    },
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

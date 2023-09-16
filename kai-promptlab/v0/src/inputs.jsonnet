{
  stepsGroups: [
    {
      description: "Data App",
      required: "all",
      steps: [
          {
          icon: "component:keboola.data-apps",
          name: "Data App",
          description: "Configure Data App",
          dialogName: "Kai PromptLab", 
          dialogDescription: "",
          inputs: [
            {
              id: "data-apps",
              name: "Let's do it!",
              description: "",
              type: "bool",
              kind: "confirm",
            },
          ],
        },
      ],
    },
  ],
}

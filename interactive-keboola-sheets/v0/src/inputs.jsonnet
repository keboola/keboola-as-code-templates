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
          dialogName: "Keboola Sheets", 
          dialogDescription: "Configure Data App by filling up required secrets.",
          inputs: [
            {
              id: "kbc_bucket_token",
              name: "Keboola Token",
              description: "Insert a storage or your master token.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "kbc_stack",
              name: "Keboola URL",
              description: "Provide the URL or location of your project.",
              type: "string",
              kind: "input",
              default: "https://connection.north-europe.azure.keboola.com"
            },
          ],
        },
      ]
    },
  ],
}

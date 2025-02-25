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
              id: "kbc_storage_token",
              name: "Keboola Token",
              description: "Insert a storage or your master token.",
              type: "string",
              kind: "hidden",
              rules: "required",
            }
          ],
        },
      ]
    },
  ],
}

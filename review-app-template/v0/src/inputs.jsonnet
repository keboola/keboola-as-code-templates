{
  stepsGroups: [
    {
      description: "Source Component",
      required: "all",
      steps: [
        {
          icon: "component:apify.apify",
          name: "Apify Component",
          description: "Apify Data Source",
          dialogName: "Configure Apify Component", 
          dialogDescription: "Apify component downloads data about google reviews.",
          inputs: [
            {
              id: "apify-token",
              name: "Apify token",
              description: "Insert your Apify token.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "apify-actor-id",
              name: "Apify Actor Id",
              description: "Insert ID of the Actor you want to run from Apify account.",
              type: "string",
              kind: "input",
              rules: "required",
            },
            {
              id: "apify-input-start-url",
              name: "Google Maps URL",
              description: "",
              type: "string",
              kind: "input",
            },
          ]
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
          dialogName: "Set up Review Generator", 
          dialogDescription: "Configure Data App by filling up required secrets.",
          inputs: [
            {
              id: "keboola-storage-token",
              name: "Keboola Token",
              ddescription: "Insert a storage or your master token.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "openai-token",
              name: "OpenAI Token",
              description: "Insert your token to your OpenAI account.",
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

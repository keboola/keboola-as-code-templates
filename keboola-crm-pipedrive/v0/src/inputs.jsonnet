{
  stepsGroups: [
    {
      description: "Configure your credentials for Pipedrive data source.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-pipedrive",
          name: "Pipedrive",
          description: "Pipedrive - Data Source",
          dialogName: "Pipedrive Data Source", 
          dialogDescription: "This extractor is getting data from Pipedrive. It's an incremental update and the extractor is taking data about: companies, activities, lists, owners, contacts, deals and pipelines.",
          inputs: [
            {
              id: "ex-pipedrive-api-authentication-query-api-token-attr",
              name: "Api token",
              description: "",
              type: "string",
              kind: "input",
              default: "#apiToken",
            },
            {
              id: "ex-pipedrive-api-base-url-args-1-attr",
              name: "Api BaseUrl Args Attr",
              description: "",
              type: "string",
              kind: "input",
              default: "companyDomain",
            },
            {
              id: "ex-pipedrive-config-api-token",
              name: "API token",
              description: "",
              type: "string",
              kind: "hidden",
            },
          ],
        },
      ],
    },
  ],
}

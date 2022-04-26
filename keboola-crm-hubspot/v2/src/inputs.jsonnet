local snowflake = import "/<common>/out-crm-snowflake/v0/src/inputs.jsonnet";
local hubspot = import "/<common>/in-crm-hubspot/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for hubspot extractor.",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-hubspot-crm",
          name: "Hubspot",
          description: "Hubspot - Data Source",
          dialogName: "Hubspot Data Source", 
          dialogDescription: "This extractor is getting data from HubSpot. It's an incremental update and the extractor is taking data about: companies, activities, lists, owners, contacts, deals and pipelines.",
          inputs: [
            hubspot
          ]
        }
      ]
    },
    {
      description: "Writer",
      required: "optional",
      steps: [
          {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake Destination",
          description: "Load to data into snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Data load to Snowflake DB.",
          inputs: [
            snowflake
          ]
        },
        {
          icon: "component:keboola.wr-google-sheet",
          name: "Google sheet Destination",
          description: "Load to data into google sheet",
          dialogName: "Google Sheet Destination", 
          dialogDescription: "Data load to Google Sheet.",
          inputs: [
            {
              id: "google-sheet-checkbox",
              name: "Google sheet destination",
              description: "Do you want to load data into google sheet?",
              type: "bool",
              kind: "confirm",
              rules: "required",
            },
          ],  
        },
      ]
    },
  ],
}
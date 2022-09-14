local snowflake = import "/<common>/inputs/snowflake.jsonnet";
local hubspot = import "/<common>/in-crm-hubspot/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Source component",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-hubspot-crm",
          name: "HubSpot",
          description: "Import data from HubSpot",
          dialogName: "HubSpot Source", 
          dialogDescription: "This source component imports data from HubSpot. Enter your HubSpot API token from your HubSpot Super Admin account. Please note that API key authentication will be deprecated starting 10/2022.",
          #"This source component imports data from HubSpot (companies, deals, activities, etc.). Enter your HubSpot API token from your HubSpot Super Admin account and start loading.",
          inputs: hubspot,
        }
      ]
    },
    {   
      description: "Snowflake Transformation",
      required: "all",
      steps: [
        {
          icon: "component:keboola.snowflake-transformation",
          name: "Snowflake SQL",
          description: "Transformation",
          inputs: [],
        },
      ]
    },
    {
      description: "Destination component",
      required: "all",
      steps: [
          {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake Destination",
          description: "Load data into Snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Fill your database credentials. Don’t have your own data warehouse? No worries, follow [these instructions](https://docs.google.com/document/d/1_7DRa7KdeXT1ZZ22ENDxW4fDO1BL_n8uTqhiSQms2pE).",
          inputs: snowflake,
        },
      ]
    },
  ],
}

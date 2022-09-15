local snowflake = import "/<common>/out-thoughtspot-hubspot-snowflake/v0/src/inputs.jsonnet";
local bigquery = import "/<common>/out-thoughtspot-hubspot-bigquery/v0/src/inputs.jsonnet";
local hubspot = import "/<common>/in-thoughtspot-hubspot/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Provide credentials for the Hubspot source component.",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-hubspot-crm",
          name: "Hubspot",
          description: "Import data from Hubspot",
          dialogName: "Hubspot Source", 
          dialogDescription: "Import data from HubSpot. Enter your HubSpot token and set the scopes based on [this manual](https://docs.google.com/document/d/1jmnQ5Hazu4rmaTGxHwI0EybBmzpIadlpPHc6gN_kTU8).",
          #"This source component imports data from HubSpot (companies, deals, activities, etc.). Enter your HubSpot API token from your HubSpot Super Admin account and start loading.",
          inputs: hubspot,  
        },
      ],
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
      description: "Provide credentials for the destination component.",
      required: "optional",
      steps: [
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake",
          description: "Load data into Snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Fill your database credentials. Don’t have your own data warehouse? No worries, follow [these instructions](https://docs.google.com/document/d/1_7DRa7KdeXT1ZZ22ENDxW4fDO1BL_n8uTqhiSQms2pE).",
          inputs: snowflake,
        },
        {
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google BigQuery",
          description: "Load data into BigQuery",
          dialogName: "BigQuery Destination", 
          dialogDescription: "This destination component loads data into a BigQuery dataset.",
          inputs: bigquery,  
        },
      ],
    },
    {   
      description: "ThoughtSpot",
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-thoughtspot",
          name: "ThoughtSpot",
          description: "Reporting in ThoughSpot",
          dialogName: "ThoughtSpot",
          dialogDescription: "To set up your connection in Thoughtspot, log in to your account there and make sure you have the database credentials handy. If you don't have ThoughtSpot account yet, get your free trial [here](https://www.thoughtspot.com/trial).",
          inputs: [
            {
              id: "thoughtspot",
              name: "Got it!",
              description: "",
              type: "bool",
              kind: "confirm",
            },
          ],
        },
      ]
    },
  ],
}

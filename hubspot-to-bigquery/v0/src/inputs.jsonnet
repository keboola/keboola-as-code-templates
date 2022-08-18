local hubspot = import "/<common>/in-crm-hubspot/v0/src/inputs.jsonnet";
local bigquery = import "/<common>/out-crm-bigquery/v0/src/inputs.jsonnet";
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
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google BigQuery",
          description: "Load data into BigQuery",
          dialogName: "BigQuery Destination", 
          dialogDescription: "This destination component loads data into a Google BigQuery database.",
          inputs: bigquery
        },
      ]
    },
  ],
}

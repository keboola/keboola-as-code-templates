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
          dialogDescription: "This source component imports data from HubSpot (companies, deals, activities, etc.). Enter your HubSpot API token from your HubSpot Super Admin account and start loading.",
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
          dialogDescription: "Fill your database credentials. Don’t have your own data warehouse? No worries, follow [these instructions](https://docs.google.com/document/d/1aWZw4s0NGK1nFaZ6DK8H_DQIEzAR9pg-u8eGtFaS4XA).",
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
      required: "optional",
      steps: [
        {
          icon: "component:keboola.wr-thoughtspot",
          name: "ThoughtSpot",
          description: "Reporting in ThoughSpot",
          dialogName: "ThoughtSpot",
          dialogDescription: "Set up the connection in Thoughtspot and, if you haven’t done so yet, install the [Hubspot Analytics TML](https://developers.thoughtspot.com/codespot/jira-tmp-finish) from CodeSpot.",
          inputs: [],
        },
      ]
    },
  ],
}

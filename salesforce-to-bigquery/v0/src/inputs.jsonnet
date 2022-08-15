local salesforce = import "/<common>/in-crm-salesforce/v0/src/inputs.jsonnet";
local bigquery = import "/<common>/out-crm-bigquery/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for Salesforce extractor.",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-salesforce-v2",
          name: "Salesforce",
          description: "Salesforce - Data Source",
          dialogName: "Salesforce Data Source", 
          dialogDescription: "This extractor is getting data about account, contact, event, lead, opportunity, opportunity contact role, opportunity stage and user from Salesforce.",
          inputs: salesforce,
        },
      ],
    },
    {   
      description: "Snowflake Transformations",
      required: "all",
      steps: [
        {
          icon: "component:keboola.snowflake-transformation",
          name: "Snowflake SQL",
          description: "Transformations",
          inputs: [],
        },
      ]
    },
    {
      description: "Writer",
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google Big Query",
          description: "Big Query - Destination",
          dialogName: "Big Query Destination", 
          dialogDescription: "Data load to Google Big Query",
          inputs: bigquery
        },
      ],
    },
  ],
}
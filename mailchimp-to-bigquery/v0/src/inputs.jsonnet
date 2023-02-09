local mailchimp = import "/<common>/in-mailchimp/inputs.jsonnet";
local bigquery = import "/<common>/out-mailchimp-bigquery/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for Mailchimp data source.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-mailchimp",
          name: "Mailchimp",
          description: "Mailchimp - Data Source",
          dialogName: "Mailchimp Data Source", 
          dialogDescription: "Extractor collects data from Mailchimp about campaigns, lists and members.",
          inputs: mailchimp
        }
      ]
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
      description: "Configure your credentials for data destination.",
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


local mailchimp = import "/<common>/in-mailchimp/inputs.jsonnet";
local snowflake = import "/<common>/out-mailchimp-snowflake/inputs.jsonnet";
local bigquery = import "/<common>/out-mailchimp-bigquery/inputs.jsonnet";
local googlesheet = import "/<common>/out-mailchimp-googlesheet/inputs.jsonnet";
local postgresql = import"/<common>/out-crm-postgresql/v0/src/inputs.jsonnet";
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
          backend: "snowflake",
          name: "Snowflake SQL",
          description: "Transformations",
          inputs: [],
        },
{
          icon: "component:keboola.google-bigquery-transformation",
          backend: "bigquery",
          name: "BigQuery SQL",
          description: "Transformations",
          inputs: [],
        }
      ]
    },
    {
      description: "Configure your credentials for data destination.",
      required: "optional",
      steps: [
        {
          icon: "component:<keboola.wr-snowflake>",
          name: "Snowflake Destination",
          description: "Load to data into snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Data load to Snowflake DB.",
          inputs: snowflake
        },
        {
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google Big Query",
          description: "Big Query - Destination",
          dialogName: "Big Query Destination", 
          dialogDescription: "Data load to Google Big Query",
          inputs: bigquery
        },
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Google sheet Destination",
          description: "Load to data into google sheet",
          dialogName: "Google Sheet Destination", 
          dialogDescription: "Make a copy of [this sheet](https://docs.google.com/spreadsheets/d/14SnNVWo62MfDZPbnmuJQrg2NzKZzIzwgEg5ubRYyNLo) into your Drive. Copy text between 'spreadsheets/d/' and '/edit', paste it below",
          inputs: googlesheet,  
        },
        {
          icon: "component:keboola.wr-db-pgsql",
          name: "PostgreSQL Destination",
          description: "Load to data into PostgreSQL",
          dialogName: "PostgreSQL Destination", 
          dialogDescription: "Data load to PostgreSQL DB.",
          inputs: postgresql
        },
      ],
    },
  ],
}


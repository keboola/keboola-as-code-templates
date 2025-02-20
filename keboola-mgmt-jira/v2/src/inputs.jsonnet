local jira = import "/<common>/in-mgmt-jira/inputs.jsonnet";
local snowflake = import "/<common>/out-mgmt-snowflake/inputs.jsonnet";
local bigquery = import "/<common>/out-mgmt-bigquery/inputs.jsonnet";
local googlesheet = import "/<common>/out-mgmt-gsheet/inputs.jsonnet";
local postgresql = import"/<common>/out-mgmt-postgresql/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for Jira data source.",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-jira",
          name: "Jira",
          description: "Jira - Data Source",
          dialogName: "Jira Data Source", 
          dialogDescription: "This source component collects data from Jira about projects and issues.",
          inputs: jira
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
        },,
        {
          icon: "component:keboola.google-bigquery-transformation",
          backend: "bigquery",
          name: "BigQuery SQL",
          description: "Transformations",
          inputs: [],
        },
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
          dialogDescription: "Make a copy of [this sheet](https://docs.google.com/spreadsheets/d/1zpBB_3HbD2ofXGtPYEabuHeIPVrAYpC1vllpJO5fjIA) into your Drive. Copy text between 'spreadsheets/d/' and '/edit', paste it below",
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
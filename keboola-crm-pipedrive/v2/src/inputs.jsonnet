local snowflake = import "/<common>/out-crm-snowflake/v0/src/inputs.jsonnet";
local pipedrive = import "/<common>/in-crm-pipedrive/inputs.jsonnet";
local googlesheet = import "/<common>/out-crm-gsheet/v0/src/inputs.jsonnet";
local bigquery = import "/<common>/out-crm-bigquery/v0/src/inputs.jsonnet";
local postgresql = import"/<common>/out-crm-postgresql/v0/src/inputs.jsonnet";

{
  stepsGroups: [
    {
      description: "Configure your credentials for Pipedrive data source.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-pipedrive",
          name: "PipeDrive",
          description: "Pipedrive - Data Source",
          dialogName: "Pipedrive Data Source", 
          dialogDescription: "Build custom data such as companies, deals, activities, and more by connecting to Pipedrive. With your Pipedrive admin account, enter your Pipedrive API token to start syncing your data.",
          inputs: pipedrive
        },
      ],
    },
    {   
      description: "Snowflake Transformation",
      required: "all",
      steps: [
        {
          icon: "component:keboola.snowflake-transformation",
          backend: "snowflake",
          name: "Snowflake SQL",
          description: "Transformation",
          inputs: [],
        },,
        {
          icon: "component:keboola.google-bigquery-transformation",
          backend: "bigquery",
          name: "BigQuery SQL",
          description: "Transformation",
          inputs: [],
        },
      ]
    },
    {
      description: "Data Destination",
      required: "optional",
      steps: [
          {
          icon: "component:<keboola.wr-snowflake>",
          name: "Snowflake Destination",
          description: "Load to data into snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Data load to Snowflake DB.",
          inputs: snowflake,
        },
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Google sheet Destination",
          description: "Load to data into google sheet",
          dialogName: "Google Sheet Destination", 
          dialogDescription: "Make a copy of [this sheet](https://docs.google.com/spreadsheets/d/1liGkoSKbWXSpWaSg5qHo_sLEmQWEzcCxdoXsd_wTH_U) into your Drive. Copy text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: googlesheet,  
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
          icon: "component:keboola.wr-db-pgsql",
          name: "PostgreSQL Destination",
          description: "Load to data into PostgreSQL",
          dialogName: "PostgreSQL Destination", 
          dialogDescription: "Data load to PostgreSQL DB.",
          inputs: postgresql
        },
      ]
    },
  ],
}



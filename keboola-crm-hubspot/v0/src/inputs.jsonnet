local snowflake = import "/<common>/out-crm-snowflake/v0/src/inputs.jsonnet";
local hubspot = import "/<common>/in-crm-hubspot/v0/src/inputs.jsonnet";
local googlesheet = import "/<common>/out-crm-gsheet/v0/src/inputs.jsonnet";
local bigquery = import "/<common>/out-crm-bigquery/v0/src/inputs.jsonnet";
local postgresql = import"/<common>/out-crm-postgresql/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Extractor",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-hubspot-crm",
          name: "Hubspot",
          description: "Hubspot - Data Source",
          dialogName: "Hubspot Data Source", 
          dialogDescription: "Get data such as companies, deals, activities, and more by connecting to Hubspot. With your Hubspot Super Admin account, enter your Hubspot API token to start syncing your data.",
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
      description: "Writer",
      required: "optional",
      steps: [
          {
          icon: "component:"+SnowflakeWriterComponentId(),
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
          name: "BigQuery Destination",
          description: "Load to data into Big Query",
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
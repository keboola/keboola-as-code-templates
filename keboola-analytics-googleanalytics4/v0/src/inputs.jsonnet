local snowflake = import "/<common>/out-googleanalytics4-snowflake/v0/src/inputs.jsonnet";
local bigquery = import "/<common>/out-googleanalytics4-bigquery/v0/src/inputs.jsonnet";
local googleanalytics4 = import "/<common>/in-googleanalytics4/v0/src/inputs.jsonnet";
local searchconsole = import "/<common>/in-googleanalytics-searchconsole/v0/src/inputs.jsonnet";
local googlesheet = import "/<common>/out-googleanalytics4-gsheet/v0/src/inputs.jsonnet";
local postgresql = import "/<common>/out-googleanalytics4-postgresql/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for Google Analytics data source.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-google-analytics-v4",
          name: "Google Analytics 4",
          description: "Google Analytics 4 Data Source",
          dialogName: "Analytics Data Source",
          dialogDescription: "Connect with Google Analytics 4 and sync data from it.",
          inputs: googleanalytics4
        },
      ],
    },
    {
      description: "Data Source",
      required: "optional",
      steps: [
        {
          icon: "component:kds-team.ex-google-search-console",
          name: "Google Search Console",
          description: "Google Search Console",
          dialogName: "Google Search Console",
          dialogDescription: "This data source is getting data from Google Search Console.",
          inputs: searchconsole
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
          backend: "snowflake",
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
          name: "Snowflake",
          description: "Snowflake - Destination",
          dialogName: "Snowflake Destination",
          dialogDescription: "Data load to Snowflake database.",
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
          dialogDescription: "Make a copy of [this sheet](https://docs.google.com/spreadsheets/d/1Jhe1z6y6ubhYA7H_fqT2LejPqxojXC0FTkcueY7VPbA) into your Drive. Copy text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: googlesheet
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
    }
  ]
}

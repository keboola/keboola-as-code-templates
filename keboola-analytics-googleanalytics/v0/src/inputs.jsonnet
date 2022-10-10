local snowflake = import "/<common>/out-googleanalytics-snowflake/v0/src/inputs.jsonnet";
local bigquery = import "/<common>/out-googleanalytics-bigquery/v0/src/inputs.jsonnet";
local googleanalytics = import "/<common>/in-googleanalytics/v0/src/inputs.jsonnet";
local searchconsole = import "/<common>/in-googleanalytics-searchconsole/v0/src/inputs.jsonnet";
local googlesheet = import "/<common>/out-googleanalytics-gsheet/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for Google Analytics extractor.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-google-analytics-v4",
          name: "Google Analytics",
          description: "Google Analytics Data Source",
          dialogName: "Analytics Data Source",
          dialogDescription: "Connect with Google Analytics and sync data from it.",
          inputs: googleanalytics
        },
      ],
    },
    {
      description: "Extractor",
      required: "optional",
      steps: [
        {
          icon: "component:kds-team.ex-google-search-console",
          name: "Google Search Console",
          description: "Google Search Console",
          dialogName: "Google Search Console",
          dialogDescription: "This extractor is getting data from Google Search Console.",
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
          inputs: [],
        },
      ]
    },
    {
      description: "Configure your credentials for writer.",
      required: "optional",
      steps: [
        {
          icon: "component:"+SnowflakeWriterComponentId(),
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
          dialogDescription: "Make a copy of [this sheet](https://docs.google.com/spreadsheets/d/19IUIjgwmnBOLaAB8t8kf7PmkpH7jRjFsxLlsOyrBsdo) into your Drive. Copy text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: googlesheet
        }
      ]
    }
  ]
}

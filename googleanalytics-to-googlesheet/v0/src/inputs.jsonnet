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
      required: "all",
      steps: [
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

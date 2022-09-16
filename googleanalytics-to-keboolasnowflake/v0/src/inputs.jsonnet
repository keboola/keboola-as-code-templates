local kbc_snowflake = import "/<common>/inputs/keboolasnowflake.jsonnet";
local googleanalytics = import "/<common>/in-googleanalytics/v0/src/inputs.jsonnet";
local searchconsole = import "/<common>/in-googleanalytics-searchconsole/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Provide credentials for the source component.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-google-analytics-v4",
          name: "Google Analytics",
          description: "Import data from Google Analytics",
          dialogName: "Google Analytics Source",
          dialogDescription: "This source component imports data from your Google Analytics account.",
          inputs: googleanalytics
        },
      ],
    },
    {
      description: "Source component",
      required: "optional",
      steps: [
        {
          icon: "component:kds-team.ex-google-search-console",
          name: "Google Search Console",
          description: "Import data from Google Search Console",
          dialogName: "Google Search Console",
          dialogDescription: "This source component imports data from your Google Search Console.",
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
      description: "Destination component.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "DWH provided by Keboola",
          description: "Keboola - managed Snowflake",
          dialogName: "DWH provided by Keboola", 
          dialogDescription: "You don't need your own DWH. After setting up the use case, go to configuration of Snowflake Data Destination and select Keboola provided database when setting up credentials.",
          inputs: kbc_snowflake
        },
      ],
    },
  ]
}

local github = import "/<common>/in-git-github/inputs.jsonnet";
local snowflake = import "/<common>/out-git-snowflake/inputs.jsonnet";
local bigquery = import "/<common>/out-git-bigquery/inputs.jsonnet";
local googlesheet = import "/<common>/out-git-gsheet/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for GitHub data source.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-github",
          name: "GitHub",
          description: "GitHub - Data Source",
          dialogName: "GitHub Data Source", 
          dialogDescription: "Extractor collects data from GitHub about organizations, teams, members, repositories, commits, issues and pull requests.",
          inputs: github
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
      required: "optional",
      steps: [
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
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
          dialogDescription: "Make a copy of the sheet https://docs.google.com/spreadsheets/d/15Zylb18Kv2lIMD891-6pO1Diu0W6C-J_RHdrIbxX-qI/edit#gid=0 into your Drive. Copy text between 'spreadsheets/d/' and '/edit', paste it below",
          inputs: googlesheet,  
        },
      ],
    },
  ],
}
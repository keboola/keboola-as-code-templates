local github = import "/<common>/in-git-github/inputs.jsonnet";
local googlesheet = import "/<common>/out-git-gsheet/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Provide credentials for the source component.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-github",
          name: "GitHub",
          description: "Import data from GitHub",
          dialogName: "GitHub Source", 
          dialogDescription: "This source component imports data from GitHub (organizations, teams, members, repositories, commits, issues, and pull requests).",
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
      description: "Provide credentials for the destination component.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Google Sheets",
          description: "Load data into Google Sheets",
          dialogName: "Google Sheets Destination", 
          dialogDescription: "Copy of [this sheet](https://docs.google.com/spreadsheets/d/15Zylb18Kv2lIMD891-6pO1Diu0W6C-J_RHdrIbxX-qI) into your drive. Copy the text between 'spreadsheets/d/' and '/edit', and paste it below.",
          inputs: googlesheet,  
        },
      ],
    },
  ],
}

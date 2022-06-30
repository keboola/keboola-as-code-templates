local asana = import "/<common>/in-mgmt-asana/inputs.jsonnet";
local googlesheet = import "/<common>/out-mgmt-gsheet/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for Asana data source.",
      required: "all",
      steps: [
        {
          icon: "component:leochan.ex-asana",
          name: "Asana",
          description: "Asana - Data Source",
          dialogName: "Asana Data Source", 
          dialogDescription: "Extractor collects data from Asana about projects and tasks.",
          inputs: asana
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
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Google sheet Destination",
          description: "Load to data into google sheet",
          dialogName: "Google Sheet Destination", 
          dialogDescription: "Make a copy of [this sheet](https://docs.google.com/spreadsheets/d/1zpBB_3HbD2ofXGtPYEabuHeIPVrAYpC1vllpJO5fjIA) into your Drive. Copy text between 'spreadsheets/d/' and '/edit', paste it below.",
          inputs: googlesheet,  
        },
      ],
    },
  ],
}

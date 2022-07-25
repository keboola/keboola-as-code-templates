local asana = import "/<common>/in-mgmt-asana/inputs.jsonnet";
local googlesheet = import "/<common>/out-mgmt-gsheet/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Provide credentials for the source component.",
      required: "all",
      steps: [
        {
          icon: "component:leochan.ex-asana",
          name: "Asana",
          description: "Import data from Asana",
          dialogName: "Asana Source", 
          dialogDescription: "This source component imports data about projects and tasks from Asana.",
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
      description: "Provide credentials for the destination component.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Google Sheets",
          description: "Load data into Google Sheets",
          dialogName: "Google Sheets Destination", 
          dialogDescription: "Copy [this sheet](https://docs.google.com/spreadsheets/d/1zpBB_3HbD2ofXGtPYEabuHeIPVrAYpC1vllpJO5fjIA) into your drive. Copy the text between 'spreadsheets/d/' and '/edit', and paste it below.",
          inputs: googlesheet,  
        },
      ],
    },
  ],
}

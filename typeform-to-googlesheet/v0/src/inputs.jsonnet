local typeform = import "/<common>/in-typeform/inputs.jsonnet";
local googlesheet = import "/<common>/out-typeform-gsheet/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Provide credentials for the source component.",
      required: "all",
      steps: [
        {
          icon: "component:fisa.ex-typeform",
          name: "Typeform",
          description: "Import data from Typeform",
          dialogName: "Typeform Source", 
          dialogDescription: "This source component imports data from Typeform (list of forms, basic form statistics, list of questions and responses). Enter your Typeform API token to start loading.",
          inputs: typeform,
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
      description: "Provide credentials for the destination component.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Google Sheets",
          description: "Load to data into Google Sheets",
          dialogName: "Google Sheets Destination", 
          dialogDescription: "Copy [this sheet](https://docs.google.com/spreadsheets/d/1liGkoSKbWXSpWaSg5qHo_sLEmQWEzcCxdoXsd_wTH_U) into your drive. Copy the text between 'spreadsheets/d/' and '/edit', and paste it below.",
          inputs: googlesheet,  
        },
      ]
    },
  ],
}

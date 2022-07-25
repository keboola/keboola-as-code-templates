local typeform = import "/<common>/in-typeform/inputs.jsonnet";
local googlesheet = import "/<common>/out-typeform-gsheet/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for Typeform data source.",
      required: "all",
      steps: [
        {
          icon: "component:fisa.ex-typeform",
          name: "Typeform",
          description: "Typeform - Data Source",
          dialogName: "Typeform Data Source", 
          dialogDescription: "Get data such as list of forms, basic form statistics, list of questions, responses. Enter your Typeform API token to start syncing your data.",
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
      description: "Configure your credentials for data destination.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Google sheet Destination",
          description: "Load to data into google sheet",
          dialogName: "Google Sheet Destination", 
          dialogDescription: "Make a copy of [this sheet](https://docs.google.com/spreadsheets/d/1liGkoSKbWXSpWaSg5qHo_sLEmQWEzcCxdoXsd_wTH_U) into your Drive. Copy text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: googlesheet,  
        },
      ]
    },
  ],
}
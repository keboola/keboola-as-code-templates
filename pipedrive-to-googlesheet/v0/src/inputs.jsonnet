local pipedrive = import "/<common>/in-crm-pipedrive/inputs.jsonnet";
local googlesheet = import "/<common>/out-crm-gsheet/v0/src/inputs.jsonnet";

{
  stepsGroups: [
    {
      description: "Provide credentials for the source component.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-pipedrive",
          name: "Pipedrive",
          description: "Import data from Pipedrive",
          dialogName: "Pipedrive Source", 
          dialogDescription: "This source component imports data from Pipedrive (companies, deals, activities, etc.). Enter your Pipedrive API token from your Pipedrive admin account to start loading.",
          inputs: pipedrive
        },
      ],
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
      description: "Destination component",
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-google-sheet",
          name: "Google Sheets",
          description: "Load data into Google Sheets",
          dialogName: "Google Sheets Destination", 
          dialogDescription: "Copy [this sheet](https://docs.google.com/spreadsheets/d/1liGkoSKbWXSpWaSg5qHo_sLEmQWEzcCxdoXsd_wTH_U) into your drive. Copy the text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: googlesheet,  
        },
      ]
    },
  ],
}



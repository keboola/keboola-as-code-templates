local snowflake = import "/<common>/out-crm-snowflake/v0/src/inputs.jsonnet";
local pipedrive = import "/<common>/in-crm-pipedrive/inputs.jsonnet";
local googlesheet = import "/<common>/out-crm-gsheet/v0/src/inputs.jsonnet";

{
  stepsGroups: [
    {
      description: "Configure your credentials for Pipedrive data source.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-pipedrive",
          name: "Pipedrive",
          description: "Pipedrive - Data Source",
          dialogName: "Pipedrive Data Source", 
          dialogDescription: "This data source is getting data from Pipedrive. It's an incremental update and it is taking data about: companies, activities, lists, owners, contacts, deals and pipelines.",
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
      description: "Data Destination",
      required: "optional",
      steps: [
          {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake Destination",
          description: "Load to data into snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Data load to Snowflake DB.",
          inputs: snowflake,
        },
        {
          icon: "component:keboola.wr-google-sheet",
          name: "Google sheet Destination",
          description: "Load to data into google sheet",
          dialogName: "Google Sheet Destination", 
          dialogDescription: "Make a copy of this sheet https://docs.google.com/spreadsheets/d/1liGkoSKbWXSpWaSg5qHo_sLEmQWEzcCxdoXsd_wTH_U into your Drive. Then copy text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: googlesheet,  
        },
      ]
    },
  ],
}



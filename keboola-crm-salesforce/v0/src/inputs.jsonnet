local snowflake = import "/<common>/out-crm-snowflake/v0/src/inputs.jsonnet";
local salesforce = import "/<common>/in-crm-salesforce/v0/src/inputs.jsonnet";
local googlesheet = import "/<common>/out-crm-gsheet/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for Salesforce extractor.",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-salesforce-v2",
          name: "Salesforce",
          description: "Salesforce - Data Source",
          dialogName: "Salesforce Data Source", 
          dialogDescription: "This extractor is getting data about account, contact, event, lead, opportunity, opportunity contact role, opportunity stage and user from Salesforce.",
          inputs: salesforce,
        },
      ],
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
      description: "Writer",
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
          icon: "component:keboola.wr-google-sheets",
          name: "Google sheet Destination",
          description: "Load to data into google sheet",
          dialogName: "Google Sheet Destination", 
          dialogDescription: "Make a copy of this sheet https://docs.google.com/spreadsheets/d/1liGkoSKbWXSpWaSg5qHo_sLEmQWEzcCxdoXsd_wTH_U into your Drive. Then copy text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: googlesheet,  
        },
      ],
    },
  ],
}
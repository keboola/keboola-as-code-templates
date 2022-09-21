local snowflake = import "/<common>/out-crm-snowflake/v0/src/inputs.jsonnet";
local pipedrive = import "/<common>/in-crm-pipedrive/inputs.jsonnet";

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
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake",
          description: "Load data into Snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Fill your database credentials.",
          inputs: snowflake,
        },
      ]
    },
  ],
}



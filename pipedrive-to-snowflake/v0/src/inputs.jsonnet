local snowflake = import "/<common>/out-crm-snowflake/v0/src/inputs.jsonnet";
local pipedrive = import "/<common>/in-crm-pipedrive/inputs.jsonnet";

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
          dialogDescription: "Build custom data such as companies, deals, activities, and more by connecting to Pipedrive. With your Pipedrive admin account, enter your Pipedrive API token to start syncing your data.",
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
      required: "all",
      steps: [
          {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake Destination",
          description: "Load to data into snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Data load to Snowflake DB.",
          inputs: snowflake,
        },
      ]
    },
  ],
}



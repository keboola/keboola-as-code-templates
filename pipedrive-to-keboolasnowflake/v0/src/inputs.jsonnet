local kbc_snowflake = import "/<common>/inputs/keboolasnowflakev2.jsonnet";
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
          icon: "component:"+SnowflakeWriterComponentId(),
          name: "Keboola Snowflake",
          description: "Keboola - managed Snowflake",
          dialogName: "Keboola Snowflake", 
          dialogDescription: "You don't need your own DWH. After setting up the template, go to configuration of Snowflake Data Destination and select Keboola provided database when setting up credentials.",
          inputs: kbc_snowflake
        },
      ]
    },
  ],
}



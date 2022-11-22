local asana = import "/<common>/in-mgmt-asana/inputs.jsonnet";
local kbc_snowflake = import "/<common>/inputs/keboolasnowflakev2.jsonnet";
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
          dialogDescription: "This source component collects data about projects and tasks from Asana.",
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
      description: "Destination component.",
      required: "all",
      steps: [
        {
          icon: "component:"+SnowflakeWriterComponentId(),
          name: "DWH provided by Keboola",
          description: "Keboola - managed Snowflake",
          dialogName: "DWH provided by Keboola", 
          dialogDescription: "You don't need your own DWH. After setting up the template, go to configuration of Snowflake Data Destination and select Keboola provided database when setting up credentials.",
          inputs: kbc_snowflake
        },
      ],
    },
  ],
}

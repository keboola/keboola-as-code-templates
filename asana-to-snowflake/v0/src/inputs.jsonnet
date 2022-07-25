local asana = import "/<common>/in-mgmt-asana/inputs.jsonnet";
local snowflake = import "/<common>/out-mgmt-snowflake/inputs.jsonnet";
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
      description: "Provide credentials for the destination component.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake",
          description: "Load data into Snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "This destination component loads data into a Snowflake database.",
          inputs: snowflake
        },
      ],
    },
  ],
}

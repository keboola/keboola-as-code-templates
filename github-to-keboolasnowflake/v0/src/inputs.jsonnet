local github = import "/<common>/in-git-github/inputs.jsonnet";
local kbc_snowflake = import "/<common>/inputs/keboolasnowflake.jsonnet";
{
  stepsGroups: [
    {
      description: "Provide credentials for the source component.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-github",
          name: "GitHub",
          description: "Import data from GitHub",
          dialogName: "GitHub Source",
          dialogDescription: "This source component imports data from GitHub (organizations, teams, members, repositories, commits, issues, and pull requests).",
          inputs: github
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
          dialogDescription: "You don't need your own DWH. After setting up the use case, go to configuration of Snowflake Data Destination and select Keboola provided database when setting up credentials.",
          inputs: kbc_snowflake
        },
      ],
    },
  ],
}

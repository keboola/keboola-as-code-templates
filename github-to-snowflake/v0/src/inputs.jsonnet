local github = import "/<common>/in-git-github/inputs.jsonnet";
local snowflake = import "/<common>/out-git-snowflake/inputs.jsonnet";
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

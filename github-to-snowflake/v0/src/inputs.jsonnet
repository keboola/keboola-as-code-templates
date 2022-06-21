local github = import "/<common>/in-git-github/inputs.jsonnet";
local snowflake = import "/<common>/out-git-snowflake/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for GitHub data source.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-github",
          name: "GitHub",
          description: "GitHub - Data Source",
          dialogName: "GitHub Data Source", 
          dialogDescription: "Extractor collects data from GitHub about organizations, teams, members, repositories, commits, issues and pull requests.",
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
      description: "Configure your credentials for data destination.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake Destination",
          description: "Load to data into snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Data load to Snowflake DB.",
          inputs: snowflake
        },
      ],
    },
  ],
}
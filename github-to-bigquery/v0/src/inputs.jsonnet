local github = import "/<common>/in-git-github/inputs.jsonnet";
local bigquery = import "/<common>/out-git-bigquery/inputs.jsonnet";
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
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google Big Query",
          description: "Big Query - Destination",
          dialogName: "Big Query Destination", 
          dialogDescription: "Data load to Google Big Query",
          inputs: bigquery
        },
      ],
    },
  ],
}
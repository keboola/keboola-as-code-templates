local asana = import "/<common>/in-mgmt-asana/inputs.jsonnet";
local bigquery = import "/<common>/out-mgmt-bigquery/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for Asana data source.",
      required: "all",
      steps: [
        {
          icon: "component:leochan.ex-asana",
          name: "Asana",
          description: "Asana - Data Source",
          dialogName: "Asana Data Source", 
          dialogDescription: "Extractor collects data from Asana about projects and tasks.",
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

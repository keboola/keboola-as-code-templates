local snowflake = import "/<common>/out-thoughtspot-googleanalytics-snowflake/v0/src/inputs.jsonnet";
local bigquery = import "/<common>/out-thoughtspot-googleanalytics-bigquery/v0/src/inputs.jsonnet";
local googleanalytics = import "/<common>/in-googleanalytics/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Provide credentials for the source component.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-google-analytics-v4",
          name: "Google Analytics",
          description: "Import data from Google Analytics",
          dialogName: "Google Analytics Source",
          dialogDescription: "This source component imports data from Google Analytics.",
          inputs: googleanalytics
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
      description: "Provide credentials for the destination component.",
      required: "optional",
      steps: [
        {
          icon: "component:"+SnowflakeWriterComponentId(),
          name: "Snowflake",
          description: "Load data into Snowflake",
          dialogName: "Snowflake Destination",
          dialogDescription: "Fill your database credentials. Don’t have your own data warehouse? No worries, follow [these instructions](https://docs.google.com/document/d/1_7DRa7KdeXT1ZZ22ENDxW4fDO1BL_n8uTqhiSQms2pE).",
          inputs: snowflake
        },
        {
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google BigQuery",
          description: "Load data into BigQuery",
          dialogName: "BigQuery Destination",
          dialogDescription: "This destination component loads data into a BigQuery dataset.",
          inputs: bigquery
        }
      ]
    }
  ]
}

local typeform = import "/<common>/in-typeform/inputs.jsonnet";
local bigquery = import "/<common>/out-typeform-bigquery/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Provide credentials for the source component.",
      required: "all",
      steps: [
        {
          icon: "component:fisa.ex-typeform",
          name: "Typeform",
          description: "Import data from Typeform",
          dialogName: "Typeform Source", 
          dialogDescription: "This source component imports data from Typeform (list of forms, basic form statistics, list of questions and responses). Enter your Typeform API token to start loading.",
          inputs: typeform,
        }
      ]
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
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google BigQuery",
          description: "Load data into BigQuery",
          dialogName: "BigQuery Destination", 
          dialogDescription: "This destination component loads data into a Google BigQuery database.",
          inputs: bigquery
        },
      ]
    },
  ],
}

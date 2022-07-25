local typeform = import "/<common>/in-typeform/inputs.jsonnet";
local bigquery = import "/<common>/out-typeform-bigquery/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for Typeform data source.",
      required: "all",
      steps: [
        {
          icon: "component:fisa.ex-typeform",
          name: "Typeform",
          description: "Typeform - Data Source",
          dialogName: "Typeform Data Source", 
          dialogDescription: "Get data such as list of forms, basic form statistics, list of questions, responses. Enter your Typeform API token to start syncing your data.",
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
      ]
    },
  ],
}
local bigquery = import "/<common>/out-keboola-costs-bigquery/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for Telemetry data source.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-telemetry-data",
          name: "Telemetry data",
          description: "Telemetry data - Data Source",
          dialogName: "Telemetry - Data Source",
          dialogDescription: "This data source is getting data about your Keboola project.",
          inputs: [],
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
    }
  ],
}

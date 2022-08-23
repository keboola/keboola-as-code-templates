local snowflake = import "/<common>/out-keboola-costs-snowflake/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Data source",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-telemetry-data",
          name: "Telemetry",
          description: "Import data from Telemetry",
          dialogName: "Telemetry Source",
          dialogDescription: "This source component imports Telemetry data about your Keboola project.",
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
      description: "Destination component",
      required: "optional",
      steps: [
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake",
          description: "Load data into Snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Fill your database credentials. Don’t have your own data warehouse? No worries, follow [these instructions](https://docs.google.com/document/d/1aWZw4s0NGK1nFaZ6DK8H_DQIEzAR9pg-u8eGtFaS4XA).",
          inputs: snowflake,
        },
      ]
    }
  ],
}

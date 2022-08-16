local snowflake = import "/<common>/out-keboola-costs-snowflake/inputs.jsonnet";
local googlesheet = import "/<common>/out-keboola-costs-gsheet/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Provide credentials for the source component.",
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
      description: "Provide credentials for the destination component.",
      required: "optional",
      steps: [
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake",
          description: "Load to data into Snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "This destination component loads data into a Snowflake database.",
          inputs: snowflake,
        },
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Google Sheets",
          description: "Load data into Google Sheets",
          dialogName: "Google Sheets Destination", 
          dialogDescription: "Copy [this sheet](https://docs.google.com/spreadsheets/d/1y-p5GHgsQ20kjxqLcT7hYEsUDdbQHoPJi4dMoaGAFBM) into your drive. Copy the text between 'spreadsheets/d/' and '/edit', and paste it below.",
          inputs: googlesheet,
        },
      ]
    }
  ],
}

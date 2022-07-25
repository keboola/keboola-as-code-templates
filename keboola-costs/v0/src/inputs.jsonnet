local snowflake = import "/<common>/out-activity-center-project/inputs.jsonnet";
local googlesheet = import "/<common>/out-keboola-costs-gsheet/inputs.jsonnet";
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
      required: "optional",
      steps: [
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake Destination",
          description: "Load to data into Snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Data load to Snowflake DB.",
          inputs: snowflake,
        },
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Google Sheet Destination",
          description: "Load to data into Google Sheet",
          dialogName: "Google Sheet Destination", 
          dialogDescription: "Make a copy of [this sheet](https://docs.google.com/spreadsheets/d/1y-p5GHgsQ20kjxqLcT7hYEsUDdbQHoPJi4dMoaGAFBM) into your Drive. Copy text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: googlesheet,
        },
      ]
    }
  ],
}

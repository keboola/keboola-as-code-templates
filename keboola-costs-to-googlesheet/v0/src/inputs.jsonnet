local googlesheet = import "/<common>/out-keboola-costs-gsheet/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Source component",
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
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Google Sheets",
          description: "Load data into Google Sheets",
          dialogName: "Google Sheets Destination", 
          dialogDescription: "Copy [this sheet](https://docs.google.com/spreadsheets/d/12N1rL9EkISZ_cFTEp7RdMGkSnV2n4QWhxmzCh9JMmfI) into your drive. Copy the text between 'spreadsheets/d/' and '/edit', and paste it below.",
          inputs: googlesheet,
        },
      ]
    }
  ],
}

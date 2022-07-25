local typeform = import "/<common>/in-typeform/inputs.jsonnet";
local snowflake = import "/<common>/out-typeform-snowflake/inputs.jsonnet";
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
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake Destination",
          description: "Load to data into snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Data load to Snowflake DB.",
          inputs: snowflake,
        },
      ]
    },
  ],
}
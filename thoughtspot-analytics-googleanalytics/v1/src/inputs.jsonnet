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
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake",
          description: "Load data into Snowflake",
          dialogName: "Snowflake Destination",
          dialogDescription: "This destination component loads data into a Snowflake database.",
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
    },
    {   
      description: "ThoughtSpot",
      required: "optional",
      steps: [
        {
          icon: "component:keboola.wr-thoughtspot",
          name: "ThoughtSpot",
          description: "Reporting in ThoughtSpot",
          dialogName: "ThoughtSpot",
          dialogDescription: "Set up the connection in Thoughtspot and, if you haven't done so yet, install the [Google Analytics TML](https://developers.thoughtspot.com/codespot/google-analytics-tml-blocks) from CodeSpot.",
          inputs: [
            {
              id: "thoughtspot",
              name: "Continue in Thoughtspot",
              description: "",
              type: "string",
              kind: "input",
            },
          ],
        },
      ]
    },
  ]
}

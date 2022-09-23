local kbc_snowflake = import "/<common>/inputs/snowflake.jsonnet";
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
          dialogDescription: "Fill your database credentials.",
          inputs: snowflake
        },
        {
          icon: "component:"+SnowflakeWriterComponentId(),
          name: "DWH provided by Keboola",
          description: "Keboola - managed Snowflake",
          dialogName: "DWH provided by Keboola",
          dialogDescription: "You don't need your own DWH. After setting up the use case, go to configuration of Snowflake Data Destination and select Keboola provided database when setting up credentials.",
          inputs: kbc_snowflake
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
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-thoughtspot",
          name: "ThoughtSpot",
          description: "Reporting in ThoughtSpot",
          dialogName: "ThoughtSpot",
          dialogDescription: "To set up your connection in Thoughtspot, log in to your account there and make sure you have the database credentials handy. If you don't have ThoughtSpot account yet, get your free trial [here](https://go.thoughtspot.com/trial-pm.html?tsref=keboola&utm_medium=partner&utm_source=keboola&utm_campaign=free-trial).",
          inputs: [
            {
              id: "thoughtspot",
              name: "Got it!",
              description: "",
              type: "bool",
              kind: "confirm",
            },
          ],
        },
      ]
    },
  ]
}

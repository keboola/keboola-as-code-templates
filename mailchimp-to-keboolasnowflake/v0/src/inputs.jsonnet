local mailchimp = import "/<common>/in-mailchimp/inputs.jsonnet";
local kbc_snowflake = import "/<common>/inputs/keboolasnowflake.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for Mailchimp data source.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-mailchimp",
          name: "Mailchimp",
          description: "Mailchimp - Data Source",
          dialogName: "Mailchimp Data Source",
          dialogDescription: "Extractor collects data from Mailchimp about campaigns, lists and members.",
          inputs: mailchimp
        }
      ]
    },
    {
      description: "Snowflake Transformations",
      required: "all",
      steps: [
        {
          icon: "component:keboola.snowflake-transformation",
          name: "Snowflake SQL",
          description: "Transformations",
          inputs: [],
        },
      ]
    },
    {
      description: "Destination component.",
      required: "all",
      steps: [
        {
          icon: "component:"+SnowflakeWriterComponentId(),
          name: "DWH provided by Keboola",
          description: "Keboola - managed Snowflake",
          dialogName: "DWH provided by Keboola",
          dialogDescription: "You don't need your own DWH. After setting up the use case, go to configuration of Snowflake Data Destination and select Keboola provided database when setting up credentials.",
          inputs: kbc_snowflake
        }
      ],
    },
  ],
}


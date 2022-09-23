local snowflake = import "/<common>/out-crm-snowflake/v0/src/inputs.jsonnet";
local salesforce = import "/<common>/in-crm-salesforce/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Provide credentials for the source component.",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-salesforce-v2",
          name: "Salesforce",
          description: "Import data from Salesforce",
          dialogName: "Salesforce Source",
          dialogDescription: "This source component imports data from your Salesforce account (accounts, contacts, events, leads, opportunities, opportunity contact roles, opportunity stages, and users.",
          inputs: salesforce,
        },
      ],
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
      description: "Destination component",
      required: "all",
      steps: [
          {
          icon: "component:"+SnowflakeWriterComponentId(),
          name: "Snowflake",
          description: "Load data into Snowflake",
          dialogName: "Snowflake Destination",
          dialogDescription: "Fill your database credentials.",
          inputs: snowflake,
        },
      ],
    },
  ],
}

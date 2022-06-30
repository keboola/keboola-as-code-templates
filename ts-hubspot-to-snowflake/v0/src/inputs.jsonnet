local snowflake = import "/<common>/out-thoughtspot-hubspot-snowflake/v0/src/inputs.jsonnet";
local hubspot = import "/<common>/in-thoughtspot-hubspot/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Provide credentials for the source component.",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-hubspot-crm",
          name: "HubSpot",
          description: "Import data from HubSpot",
          dialogName: "HubSpot Source", 
          dialogDescription: "This source component imports data from HubSpot (companies, deals, activities, etc.). Enter your HubSpot API token from your HubSpot Super Admin account and start loading.",
          inputs: hubspot,  
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
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake",
          description: "Load data into Snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "This destination component loads data into a Snowflake database.",
          inputs: snowflake,
        },
      ],
    },
  ],
}

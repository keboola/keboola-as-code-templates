local snowflake = import "/<common>/out-crm-snowflake/v0/src/inputs.jsonnet";
local hubspot = import "/<common>/in-crm-hubspot/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Extractor",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-hubspot-crm",
          name: "Hubspot",
          description: "Hubspot - Data Source",
          dialogName: "Hubspot Data Source", 
          dialogDescription: "This extractor is getting data from HubSpot. It's an incremental update and the extractor is taking data about: companies, activities, lists, owners, contacts, deals and pipelines.",
          inputs: hubspot,
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
      description: "Writer",
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
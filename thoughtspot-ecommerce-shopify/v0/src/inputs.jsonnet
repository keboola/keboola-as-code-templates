local snowflake = import "/<common>/out-ecommerce-snowflake/v0/src/inputs.jsonnet";
local bigquery = import "/<common>/out-ecommerce-bigquery/v0/src/inputs.jsonnet";
local shopify = import "/<common>/in-ecommerce-shopify/v0/src/inputs.jsonnet";
local googlesheet = import "/<common>/out-ecommerce-gsheet/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for Shopify extractor.",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-shopify",
          name: "Shopify",
          description: "Shopify Data Source",
          dialogName: "Shopify Data Source", 
          dialogDescription: "Extractor collects data from Shopify about orders, products, inventory and customers. Use Admin API access token of your Shopify custom app. and shop id found in url, e.g. [shop_id].myshopify.com",
          inputs: shopify
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
      description: "Configure your credentials for writer.",
      required: "optional",
      steps: [
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake",
          description: "Snowflake - Destination",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Data load to Snowflake database.",
          inputs: snowflake
        },
        {
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google Big Query",
          description: "Big Query - Destination",
          dialogName: "Big Query Destination", 
          dialogDescription: "Data load to Google Big Query",
          inputs: bigquery
      },
      {
          icon: "component:keboola.wr-google-sheet",
          name: "Google sheet Destination",
          description: "Load to data into google sheet",
          dialogName: "Google Sheet Destination", 
          dialogDescription: "Data load to Google Sheet.",
          inputs: [
            {
              id: "google-sheet-checkbox",
              name: "Google sheet destination",
              description: "Do you want to load data into google sheet?",
              type: "bool",
              kind: "confirm",
              rules: "required",
            },
          ],  
        },
    ],
  },
  ],
}

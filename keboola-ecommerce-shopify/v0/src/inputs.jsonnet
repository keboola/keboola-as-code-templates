local googlesheet = import "/<common>/out-ecommerce-gsheet/v0/src/inputs.jsonnet";
local snowflake = import "/<common>/out-ecommerce-snowflake/v0/src/inputs.jsonnet";
local shopify = import "/<common>/in-ecommerce-shopify/v0/src/inputs.jsonnet";
local bigquery = import "/<common>/out-ecommerce-bigquery/v0/src/inputs.jsonnet";
local googlesheet = import "/<common>/googlesheet_inputs.jsonnet";
local facebook = import "/<common>/in-ecommerce-facebook/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Extractor",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-shopify",
          name: "Shopify",
          description: "Shopify - Data Source",
          dialogName: "Shopify Data Source", 
          dialogDescription: "Extractor collects data from Shopify about orders, products, inventory and customers. Use Admin API access token of your Shopify custom app. and shop id found in url, e.g. [shop_id].myshopify.com",
          inputs: shopify
        },
        {
          icon: "component:keboola.ex-facebook-ads",
          name: "Facebook Ads",
          description: "Facebook - Data Source",
          dialogName: "Facebook Ads Data Source", 
          dialogDescription: "This extractor is getting data about facebook ads monthly insights and insights for the last 90 days.",
          inputs: facebook
        }
      ]
    },
    {
      description: "Extractor",
      required: "optional",
      steps: [
        {
          icon: "component:keboola.ex-facebook-ads",
          name: "Facebook Ads",
          description: "Facebook - Data Source",
          dialogName: "Facebook Ads Data Source", 
          dialogDescription: "This extractor is getting data about facebook ads monthly insights and insights for the last 90 days.",
          inputs: facebook
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
      description: "Configure your credentials for writer.",
      required: "optional",
      steps: [
          {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake Destination",
          description: "Load to data into snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Data load to Snowflake DB.",
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
          inputs: googlesheet,  
        },
      ]
    }
  ]
}
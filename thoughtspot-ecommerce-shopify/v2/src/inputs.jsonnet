local snowflake = import "/<common>/out-ecommerce-snowflake/v0/src/inputs.jsonnet";
local kbc_snowflake = import "/<common>/inputs/snowflake.jsonnet";
local shopify = import "/<common>/in-ecommerce-shopify/v0/src/inputs.jsonnet";
local bigquery = import "/<common>/out-ecommerce-bigquery/v0/src/inputs.jsonnet";
local facebook = import "/<common>/in-ecommerce-facebook/v0/src/inputs.jsonnet";
local googleads = import "/<common>/in-ecommerce-googleads/v0/src/inputs.jsonnet";
local sklik = import "/<common>/in-ecommerce-sklik/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Source component",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-shopify",
          name: "Shopify",
          description: "Import data from Shopify",
          dialogName: "Shopify Source", 
          dialogDescription: "The source component loads Shopify data: orders, products, inventory, customers. Use the Admin API access token from the Shopify custom app, and Shopify ID from the URL, e.g., [shop_id].myshopify.com",
          inputs: shopify
        }
      ]
    },
    {
      description: "Source component",
      required: "optional",
      steps: [
        {
          icon: "component:keboola.ex-facebook-ads",
          name: "Facebook Ads",
          description: "Import data from Facebook Ads",
          dialogName: "Facebook Ads Source", 
          dialogDescription: "This source component imports data from Facebook Ads (monthly insights, and insights for the last 90 days).",
          inputs: facebook
        },
        {
          icon: "component:keboola.ex-google-ads",
          name: "Google Ads",
          description: "Import data from Google Ads",
          dialogName: "Google Ads Source", 
          dialogDescription: "This source component imports data from Google Ads Insights.",
          inputs: googleads
        },
        {
          icon: "component:keboola.ex-sklik",
          name: "Sklik",
          description: "Import data from Sklik",
          dialogName: "Sklik Source", 
          dialogDescription: "This source component imports data from Sklik (monthly and daily insights).",
          inputs: sklik
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
      description: "Provide credentials for the destination component.",
      required: "optional",
      steps: [
          {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake",
          description: "Your Snowflake Database",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Fill your database credentials.",
          inputs: snowflake
        },
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Keboola Provided Snowflake",
          description: "Keboola Provided Snowflake Database",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Don’t have your own data warehouse? No worries, we got you covered!",
          inputs: kbc_snowflake
        },
        {
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google BigQuery",
          description: "Load data into BigQuery",
          dialogName: "BigQuery Destination", 
          dialogDescription: "This destination component loads data into a Google BigQuery dataset.",
          inputs: bigquery
        },
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
          dialogDescription: "To set up your connection in Thoughtspot, log in to your account there and make sure you have the database credentials handy. If you don't have ThoughtSpot account yet, get your free trial [here].",
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

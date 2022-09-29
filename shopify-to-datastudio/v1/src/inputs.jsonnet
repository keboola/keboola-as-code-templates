local shopify = import "/<common>/in-ecommerce-shopify/v0/src/inputs.jsonnet";
local facebook = import "/<common>/in-ecommerce-facebook/v0/src/inputs.jsonnet";
local googleads = import "/<common>/in-ecommerce-googleads/v0/src/inputs.jsonnet";
local sklik = import "/<common>/in-ecommerce-sklik/v0/src/inputs.jsonnet";
local datastudio = import "/<common>/out-ecommerce-gsheet-datastudio/v0/src/inputs.jsonnet";

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
          dialogDescription: "The source component imports Shopify data (orders, products, inventory, etc.). Use the Admin API access token from the Shopify custom app, and Shopify ID from the URL, e.g., [shop_id].myshopify.com",
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
          dialogName: "Google Ads Data Source", 
          dialogDescription: "This source component imports data about Google Ads insights.",
          inputs: googleads
        },
        {
          icon: "component:keboola.ex-sklik",
          name: "Sklik",
          description: "Import data from Sklik",
          dialogName: "Sklik Source", 
          dialogDescription: "This source component imports data from Sklik about monthly insights and insights for the last day.",
          inputs: sklik
        }
      ]
    },
    {   
      description: "Snowflake transformations",
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
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Google Sheets",
          description: "Load data to Google Sheets for Data Studio Dashboard",
          dialogName: "Google Sheets Destination", 
          dialogDescription: "Copy [this sheet](https://docs.google.com/spreadsheets/d/1bMRx54sRUTpI6ZtLMkQD2MJtoJywHGPyKgoB8htRj4s) into your Drive. Copy the text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: datastudio,  
        },
      ]
    },
    {
      description: "Set up Dashboard in Google Data Studio",
      required: "all",
      steps: [
        {
          icon: "component:jakub-bartel.wr-data-studio",
          name: "Google Data Studio",
          description: "Set up Dashboard in Google DataStudio",
          inputs: [], 
        },
      ]
    }
  ]
}

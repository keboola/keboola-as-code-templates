local googlesheet = import "/<common>/out-ecommerce-gsheet/v0/src/inputs.jsonnet";
local snowflake = import "/<common>/out-ecommerce-snowflake/v0/src/inputs.jsonnet";
local shopify = import "/<common>/in-ecommerce-shopify/v0/src/inputs.jsonnet";
local bigquery = import "/<common>/out-ecommerce-bigquery/v0/src/inputs.jsonnet";
local googlesheet = import "/<common>/out-ecommerce-gsheet/v0/src/inputs.jsonnet";
local facebook = import "/<common>/in-ecommerce-facebook/v0/src/inputs.jsonnet";
local googleads = import "/<common>/in-ecommerce-googleads/v0/src/inputs.jsonnet";
local sklik = import "/<common>/in-ecommerce-sklik/v0/src/inputs.jsonnet";
local datastudio = import "/<common>/out-ecommerce-gsheet-datastudio/v0/src/inputs.jsonnet";
local postgresql = import "/<common>/out-ecommerce-postgresql/v0/src/inputs.jsonnet";

{
  stepsGroups: [
    {
      description: "Data Source",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-shopify",
          name: "Shopify",
          description: "Shopify - Data Source",
          dialogName: "Shopify Data Source", 
          dialogDescription: "This source component imports Shopify data (orders, products, inventory, etc.). Use the Admin API access token from the Shopify custom app, and Shopify ID from the URL, e.g., [shop_id].myshopify.com",
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
          description: "Facebook Ads - Data Source",
          dialogName: "Facebook Ads Data Source", 
          dialogDescription: "This source component is getting data about facebook ads monthly insights and insights for the last 90 days.",
          inputs: facebook
        },
        {
          icon: "component:keboola.ex-google-ads",
          name: "Google Ads",
          description: "Google Ads - Data Source",
          dialogName: "Google Ads Data Source", 
          dialogDescription: "This source component is getting data about Google ads insights.",
          inputs: googleads
        },
        {
          icon: "component:keboola.ex-sklik",
          name: "Sklik",
          description: "Sklik - Data Source",
          dialogName: "Sklik Data Source", 
          dialogDescription: "This source component is getting data about Sklik monthly and daily insights.",
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
      description: "Configure your credentials for data destination.",
      required: "optional",
      steps: [
          {
          icon: "component:<keboola.wr-snowflake>",
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
          icon: "component:keboola.wr-google-sheets",
          name: "Google sheet Destination",
          description: "Load to data into google sheet",
          dialogName: "Google Sheet Destination", 
          dialogDescription: "Make a copy of [this sheet](https://docs.google.com/spreadsheets/d/1y-p5GHgsQ20kjxqLcT7hYEsUDdbQHoPJi4dMoaGAFBM) into your Drive. Copy text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: googlesheet,  
        },
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Data Studio Dashboard",
          description: "Load to google sheet for DataStudio Dashboard",
          dialogName: "Dashboard in Data Studio", 
          dialogDescription: "Make a copy of [this sheet](https://docs.google.com/spreadsheets/d/1bMRx54sRUTpI6ZtLMkQD2MJtoJywHGPyKgoB8htRj4s) into your Drive. Copy text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: datastudio,  
        },
        {
          icon: "component:keboola.wr-db-pgsql",
          name: "PostgreSQL Destination",
          description: "Load to data into PostgreSQL",
          dialogName: "PostgreSQL Destination", 
          dialogDescription: "Data load to PostgreSQL DB.",
          inputs: postgresql
        },
      ]
    }
  ]
}
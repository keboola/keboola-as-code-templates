local shopify = import "/<common>/in-ecommerce-shopify/v1/src/inputs.jsonnet";
local bigcommerce = import "/<common>/in-ecommerce-bigcommerce/v0/src/inputs.jsonnet";
local woocommerce = import "/<common>/in-ecommerce-woocommerce/v0/src/inputs.jsonnet";
local bigquery = import "/<common>/out-ecommerce-bigquery/v1/src/inputs.jsonnet";
local postgresql = import "/<common>/out-ecommerce-postgresql/v1/src/inputs.jsonnet";
local googlesheet = import "/<common>/out-ecommerce-gsheet/v1/src/inputs.jsonnet";
local snowflake = import "/<common>/out-ecommerce-snowflake/v1/src/inputs.jsonnet";

{
  stepsGroups: [
    {
      description: "Data Source",
      required: "exactlyOne",
      steps: [
        {
          icon: "component:kds-team.ex-shopify",
          name: "Shopify",
          description: "Shopify - Data Source",
          dialogName: "Shopify Data Source", 
          dialogDescription: "This source component imports Shopify data (orders, products, inventory, etc.). Use the Admin API access token from the Shopify custom app, and Shopify ID from the URL, e.g., [shop_id].myshopify.com",
          inputs: shopify
        },
        {
          icon: "component:kds-team.ex-bigcommerce",
          name: "BigCommerce",
          description: "BigCommerce - Data Source",
          dialogName: "BigCommerce Data Source", 
          dialogDescription: "This source component imports BigCommerce data (orders, products, brands, etc.). Use the API access token from the BigCommerce custom app, and base URL path.",
          inputs: bigcommerce
        },
        {
          icon: "component:kds-team.ex-woocommerce",
          name: "WooCommerce",
          description: "WooCommerce - Data Source",
          dialogName: "WooCommerce Data Source", 
          dialogDescription: "This source component imports WooCommerce data (orders, products, customers). Use the Consumer Secret, Consumer Key and base URL path.",
          inputs: woocommerce
        }
      ]
    },
    {   
      description: "Snowflake Transformations",
      required: "all",
      steps: [
{
          icon: "component:keboola.snowflake-transformation",
          backend: "snowflake",
          name: "Snowflake SQL",
          description: "Transformations",
          inputs: [],
        },
{
          icon: "component:keboola.google-bigquery-transformation",
          backend: "bigquery",
          name: "BigQuery SQL",
          description: "Transformations",
          inputs: [],
        }
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
          dialogDescription: "Make a copy of [this sheet](https://docs.google.com/spreadsheets/d/1nPUlLJSzdMgN2aAAOOpudgWCAdAkrZK9zgVk_0phnjM) into your Drive. Copy text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: googlesheet,  
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
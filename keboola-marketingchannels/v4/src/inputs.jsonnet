local facebookads = import "/<common>/in-marketingchannels-facebookads/inputs.jsonnet";
local bingads = import "/<common>/in-marketingchannels-bingads/inputs.jsonnet";
local googleads = import "/<common>/in-marketingchannels-googleads/inputs.jsonnet";
local linkedin = import "/<common>/in-marketingchannels-linkedinads/inputs.jsonnet";
local snowflake = import "/<common>/out-marketingchannels-snowflake/v2/inputs.jsonnet";
local bigquery = import "/<common>/out-marketingchannels-bigquery/v2/inputs.jsonnet";
local gsheet = import "/<common>/out-marketingchannels-gsheet/v2/inputs.jsonnet";
local postgresql = import "/<common>/out-marketingchannels-postgresql/v2/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for marketing channels.",
      required: "atLeastOne",
      steps: [
        {
          icon: "component:keboola.ex-facebook-ads",
          name: "Facebook Ads",
          description: "Facebook Ads - Data Source",
          dialogName: "Facebook Ads Data Source", 
          dialogDescription: "Export your Facebook Ads manager data such as campaigns, adsets, ads insights and more.",
          inputs: facebookads
        },
        {
          icon: "component:kds-team.ex-bing-ads",
          name: "Bing Ads",
          description: "BingAds - Data Source",
          dialogName: "BingAds Data Source", 
          dialogDescription: "Export data from Bing Ads.",
          inputs: bingads
        },
        {
          icon: "component:leochan.ex-linkedin",
          name: "LinkedIn Ads",
          description: "LinkedIn Ads - Data Source",
          dialogName: "LinkedIn Ads Data Source", 
          dialogDescription: "Export data from Linked In such as advertising spend, ad and campaign performance. Generate effective performance insights by entering the start and end time and date below.",
          inputs: linkedin
        },
        {
          icon: "component:keboola.ex-google-ads",
          name: "Google Ads",
          description: "Google Ads - Data Source",
          dialogName: "Google Ads Data Source", 
          dialogDescription: "Export data from Google Ads such as advertising spend, ad and campaign performance. To link your Google Ads data, fill in your Google Ads Customer ID below.",
          inputs: googleads
        }
      ]
    },
    {
      description: "Transformations",
      required: "all",
      steps: [
        {
          backend: "snowflake",
          icon: "component:keboola.snowflake-transformation",
          name: "Snowflake SQL",
          description: "Transformations",
          inputs: [],
        },
        {
          backend: "bigquery",
          icon: "component:keboola.google-bigquery-transformation",
          name: "BigQuery SQL",
          description: "Transformations",
          inputs: [],
        },
      ]
    },
    {
      description: "Data Destination",
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
          icon: "component:keboola.wr-google-sheets",
          name: "Google sheet Destination",
          description: "Load to data into google sheet",
          dialogName: "Google Sheet Destination", 
          dialogDescription: "Make a copy of [this sheet](https://docs.google.com/spreadsheets/d/1KkIjJqU7wrOdfy3zJA8RSEDCtFoE5Szg9aUInL7XCB0) into your Drive. Copy text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: gsheet
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
          icon: "component:keboola.wr-db-pgsql",
          name: "PostgreSQL Destination",
          description: "Load to data into PostgreSQL",
          dialogName: "PostgreSQL Destination", 
          dialogDescription: "Data load to PostgreSQL DB.",
          inputs: postgresql
        },
        {
          icon: "component:keboola.data-apps",
          name: "Online Marketing Report",
          description: "Created data app by Streamlit",
          dialogName: "Online Marketing Report", 
          dialogDescription: "Use our interactive app to get insightful analytics for online marketing platforms data processed by this template.",
          inputs: [
            {
              id: "data-apps",
              name: "Let's do it!",
              description: "",
              type: "bool",
              kind: "confirm",
            },
          ],
        }
      ]
    }
  ]
}  

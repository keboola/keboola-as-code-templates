local facebookads = import "/<common>/in-marketingchannels-facebookads/inputs.jsonnet";
local bingads = import "/<common>/in-marketingchannels-bingads/inputs.jsonnet";
local googleads = import "/<common>/in-marketingchannels-googleads/inputs.jsonnet";
local googleanalytics = import "/<common>/in-marketingchannels-googleanalytics/inputs.jsonnet";
local linkedin = import "/<common>/in-marketingchannels-linkedinads/inputs.jsonnet";
local snowflake = import "/<common>/out-marketingchannels-snowflake/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Provide credentials for marketing channels.",
      required: "atLeastOne",
      steps: [
        {
          icon: "component:keboola.ex-facebook-ads",
          name: "Facebook Ads",
          description: "Import data from Facebook Ads",
          dialogName: "Facebook Ads Source", 
          dialogDescription: "This source component imports your Facebook Ads Manager data, e.g., campaigns, adsets, ads insights, and more.",
          inputs: facebookads
        },
        {
          icon: "component:esnerda.ex-bingads",
          name: "Bing Ads",
          description: "Import data from Bing Ads",
          dialogName: "Bing Ads Source", 
          dialogDescription: "This data source is getting data about Bing Ads campaigns for the last day. It is incremental update.",
          inputs: bingads
        },
        {
          icon: "component:leochan.ex-linkedin",
          name: "LinkedIn Ads",
          description: "Import data from LinkedIn Ads",
          dialogName: "LinkedIn Ads Source", 
          dialogDescription: "This source component imports data from LinkedIn (e.g., advertising spend, ad and campaign performance). Enter the start and end times and dates below to generate instant performance insights.",
          inputs: linkedin
        },
        {
          icon: "component:keboola.ex-google-ads",
          name: "Google Ads",
          description: "Import data from Google Ads",
          dialogName: "Google Ads Source", 
          dialogDescription: "This source component imports data from Google Ads (advertising spend, ad and campaign performance, etc.). Fill in your Google Ads Customer ID below.",
          inputs: googleads
        }
      ]
    },
    {
      description: "Google Analytics",
      required: "zeroOrOne",
      steps: [
        {
          icon: "component:keboola.ex-google-analytics-v4",
          name: "Google Analytics",
          description: "Import data from Google Analytics",
          dialogName: "Google Analytics Source", 
          dialogDescription: "This source component imports data from multiple ad platforms into Google Analytics to give you a bigger picture of your customer journeys.",
          inputs: googleanalytics
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
      description: "Data Destination",
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake",
          description: "Load data into Snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Fill your database credentials. Don’t have your own data warehouse? No worries, follow [these instructions](https://docs.google.com/document/d/1aWZw4s0NGK1nFaZ6DK8H_DQIEzAR9pg-u8eGtFaS4XA).",
          inputs: snowflake
        },
      ]
    }
  ]
}  

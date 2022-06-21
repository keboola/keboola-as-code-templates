local facebookads = import "/<common>/in-marketingchannels-facebookads/inputs.jsonnet";
local bingads = import "/<common>/in-marketingchannels-bingads/inputs.jsonnet";
local googleads = import "/<common>/in-marketingchannels-googleads/inputs.jsonnet";
local googleanalytics = import "/<common>/in-marketingchannels-googleanalytics/inputs.jsonnet";
local linkedin = import "/<common>/in-marketingchannels-linkedinads/inputs.jsonnet";
local bigquery = import "/<common>/out-marketingchannels-bigquery/inputs.jsonnet";
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
          icon: "component:esnerda.ex-bingads",
          name: "Bing Ads",
          description: "BingAds - Data Source",
          dialogName: "BingAds Data Source", 
          dialogDescription: "This data source is getting data about Bing Ads campaigns for the last day. It is incremental update.",
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
      description: "Google Analytics",
      required: "zeroOrOne",
      steps: [
        {
          icon: "component:keboola.ex-google-analytics-v4",
          name: "Google Analytics",
          description: "Google Analytics - Data Source",
          dialogName: "Analytics Data Source", 
          dialogDescription: "Export data from multiple Ads platform into Google Analytics to provide you a bigger picture of your customer journeys.",
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
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google Big Query",
          description: "Big Query - Destination",
          dialogName: "Big Query Destination", 
          dialogDescription: "Data load to Google Big Query",
          inputs: bigquery
        }
      ]
    }
  ]
}  

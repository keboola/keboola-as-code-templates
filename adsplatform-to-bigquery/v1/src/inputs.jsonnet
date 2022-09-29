local facebookads = import "/<common>/in-marketingchannels-facebookads/inputs.jsonnet";
local bingads = import "/<common>/in-marketingchannels-bingads/inputs.jsonnet";
local googleads = import "/<common>/in-marketingchannels-googleads/inputs.jsonnet";
local googleanalytics = import "/<common>/in-marketingchannels-googleanalytics/inputs.jsonnet";
local linkedin = import "/<common>/in-marketingchannels-linkedinads/inputs.jsonnet";
local bigquery = import "/<common>/out-marketingchannels-bigquery/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Provide credentials for the source components.",
      required: "atLeastOne",
      steps: [
        {
          icon: "component:keboola.ex-facebook-ads",
          name: "Facebook Ads",
          description: "Import data from Facebook Ads",
          dialogName: "Facebook Ads Source", 
          dialogDescription: "This source component imports your Facebook Ads Manager data, such as campaigns, adsets, ads insights, and more.",
          inputs: facebookads
        },
        {
          icon: "component:esnerda.ex-bingads",
          name: "Bing Ads",
          description: "Import data from Bing Ads",
          dialogName: "Bing Ads Source", 
          dialogDescription: "This source component imports data about Bing Ads campaigns.",
          inputs: bingads
        },
        {
          icon: "component:leochan.ex-linkedin",
          name: "LinkedIn Ads",
          description: "Import data from LinkedIn Ads",
          dialogName: "LinkedIn Ads Source", 
          dialogDescription: "This source component imports data from LinkedIn Ads (e.g., advertising spend). Enter the start and end times and dates below to generate instant performance insights.",
          inputs: linkedin
        },
        {
          icon: "component:keboola.ex-google-ads",
          name: "Google Ads",
          description: "Import data from Google Ads",
          dialogName: "Google Ads Source", 
          dialogDescription: "This source component imports data from Google Ads (e.g., advertising spend, ad and campaign performance). Fill in your Google Ads Customer ID below.",
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
          dialogDescription: "This source component imports data from Google Analytics (transactions and their values) to give you a bigger picture of your customer journeys.",
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
      description: "Data destination",
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google BigQuery",
          description: "Load data into BigQuery",
          dialogName: "BigQuery Destination", 
          dialogDescription: "This destination component loads data into a Google BigQuery dataset.",
          inputs: bigquery
        }
      ]
    }
  ]
}  

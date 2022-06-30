local facebookads = import "/<common>/in-marketingchannels-facebookads/inputs.jsonnet";
local bingads = import "/<common>/in-marketingchannels-bingads/inputs.jsonnet";
local googleads = import "/<common>/in-marketingchannels-googleads/inputs.jsonnet";
local googleanalytics = import "/<common>/in-marketingchannels-googleanalytics/inputs.jsonnet";
local linkedin = import "/<common>/in-marketingchannels-linkedinads/inputs.jsonnet";
local gsheet = import "/<common>/out-marketingchannels-gsheet/inputs.jsonnet";
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
          dialogDescription: "This source component imports your Facebook Ads Manager data, e.g., campaigns, adsets, ads insights, and more.",
          inputs: facebookads
        },
        {
          icon: "component:esnerda.ex-bingads",
          name: "Bing Ads",
          description: "Import data from Bing Ads",
          dialogName: "BingAds Source", 
          dialogDescription: "This source component imports data about Bing Ads campaigns for the last day. It is an incremental update.",
          inputs: bingads
        },
        {
          icon: "component:leochan.ex-linkedin",
          name: "LinkedIn Ads",
          description: "LinkedIn Ads - Data Source",
          dialogName: "LinkedIn Ads Data Source", 
          dialogDescription: "This source component imports data from LinkedIn (e.g., advertising spend, ad and campaign performance).  Enter the start and end times and dates below to generate instant performance insights.",
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
          dialogName: "Analytics Source", 
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
      description: "Data destination",
      required: "all",
      steps: [
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Google Sheet",
          description: "Load data into Google Sheet",
          dialogName: "Google Sheet Destination", 
          dialogDescription: "Copy [this sheet](https://docs.google.com/spreadsheets/d/1KkIjJqU7wrOdfy3zJA8RSEDCtFoE5Szg9aUInL7XCB0) into your Drive. Copy the text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: gsheet
        },
      ]
    }
  ]
}  

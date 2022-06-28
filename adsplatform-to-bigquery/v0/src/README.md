# Advertising Platforms to BigQuery

With this end-to-end flow you can bring into Keboola Connection data from one or more marketing channels of your choice (Facebook Ads, LinkedIn Ads, Google Ads, and Bing Ads). After all the necessary tasks are performed on the data, you load the results into BigQuery. You can also enrich the data with Google Analytics.

The process is simple. We will guide you through it, and, when needed, ask you to authorize the source and destination components.

## The flow, in a nutshell
First, you will select one or multiple source components that will provide all your available data about your campaigns. 

To enrich the marketing model with keywords, ad groups, and marketing transactions, you can also bring in your Google Analytics data (data about basic sessions and transactions). 

The data extracted from the ad platform or platforms will be placed into one output table containing basic information about campaigns, impressions, clicks, costs, and cost conversions.

Then, optionally, Google Analytics sessions (new and returns), page views, and bounces will be added to the output table, and two new tables will be created for transactions and keyword ad groups.

The data will be written into a BigQuery dataset via the BigQuery destination component.

Finally, you will run the entire flow (i.e., the sequence of all the prepared, above mentioned steps, in the correct order). All your selected source components, all data manipulations, and the BigQuery destination component, will be processed.



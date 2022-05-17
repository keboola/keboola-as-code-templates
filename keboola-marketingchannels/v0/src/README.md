# KEBOOLA-MARKETINGCHANNELS

By using this end-to-end flow you can choose any marketing channel (Facebook Ads, LinkedIn Ads, Google Ads, BingAds) and get its data for transforming and loading anywhere you prefer. You can also enrich this data with Google Analytics, it is optional.

## Steps to take:
1. Authorize your data source account
2. Optionaly select and authorize data destination
3. Run the flow

## All possible Included components' configurations:

DS -> TR1 -> TR2 -> DD -> FLOW


### DS: [KEBOOLA-MARKETINGCHANNELS-FACEBOOK] Data Source

Facebook Ads data is extracted with this data source. The data source is getting data about Facebook campaigns, ads, adsets and ads insights for the last day.

### DS: [KEBOOLA-MARKETINGCHANNELS-LINKEDIN] Data Source

LinkedIn Ads data is extracted with this data source. The data source is getting data about Linkedin campaigns for the last day.

### DS: [KEBOOLA-MARKETINGCHANNELS-GOOGLEADS] Data Source

Google Ads data is extracted with this data source. The data source is getting data about Google Ads campaigns for the last day.

### DS: [KEBOOLA-MARKETINGCHANNELS-GOOGLEANALYTICS] Data Source

Google Analytics data is extracted with this data source. The data source is getting data about basic sessions and transactions. It's an incremental upload. This data will enrich the marketing model with keywords adgroup and marketing transactions.

### TR1: [KEBOOLA-MARKETINCHANNELS-FACEBOOK] OR [KEBOOLA-MARKETINCHANNELS-LINKEDIN] OR [KEBOOLA-MARKETINCHANNELS-GOOGLEADS]  Transformation

The extracted data is transformed into one output table, which contains basic information about campaigns and also data about impressions, clicks, costs and costs conversions.

### TR2: [KEBOOLA-MARKETINGCHANNELS-GOOGLEANALYTICS] Transformation

Google Analytics transformation enriches the output table with sessions (new and returns), pageviews and bounces. With this tranformation are also created two new tables: ga transactions and keyword ad group.

### DD: [KEBOOLA-MARKETINGCHANNELS-BIGQUERY] OR [KEBOOLA-MARKETINGCHANNELS-GOOGLESHEET] OR [KEBOOLA-MARKETINGCHANNELS-SNOWFLAKE] Data destination

The data destination loads data into a BigQuery database or a Google sheet or a Snowflake database.

### FLOW: [KEBOOLA-MARKETINGCHANNELS] Flow

The flow runs marketing channels data source(s), snowflake transformation(s) and optionally selected data destination(s).

## Business Data Model





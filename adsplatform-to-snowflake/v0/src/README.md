# ADSPLATFORM-TO-SNOWFLAKE

By using this end-to-end flow you can choose any marketing channel (Facebook Ads, LinkedIn Ads, Google Ads, BingAds) and get its data for transforming and loading into Snowflake database. You can also enrich this data with Google Analytics, it is optional.

## Steps to take:
1. Authorize your data source account
2. Authorize data destination
3. Run the flow

## All possible Included components' configurations:

marketing DS -> TR1 -> TR2 -> DD -> FLOW

### DS: Data Source [IN-MKT-BINGADS] 

This data source is getting data about Bing Ads campaigns for the last day. It is incremental update.

### DS: Data Source [IN-MKT-FACEBOOK]

Facebook Ads data is extracted with this data source. The data source is getting data about Facebook campaigns, ads, adsets and ads insights for the last day.

### DS: Data Source [IN-MKT-LINKEDIN]

LinkedIn Ads data is extracted with this data source. The data source is getting data about Linkedin campaigns for the last day.

### DS: Data Source [IN-MKT-GOOGLEADS]

Google Ads data is extracted with this data source. The data source is getting data about Google Ads campaigns for the last day.

### DS: Data Source [IN-MKT-GOOGLEANALYTICS]

Google Analytics data is extracted with this data source. The data source is getting data about basic sessions and transactions. It's an incremental upload. This data will enrich the marketing model with keywords adgroup and marketing transactions.

### TR1: Transformation [IN-MKT-BINGADS] OR [IN-MKT-FACEBOOK] OR [IN-MKT-LINKEDIN] OR [IN-MKT-GOOGLEADS]

The extracted data is transformed into one output table, which contains basic information about campaigns and also data about impressions, clicks, costs and costs conversions.

### TR2: Transformation [IN-MKT-GOOGLEANALYTICS]

Google Analytics transformation enriches the output table with sessions (new and returns), pageviews and bounces. With this tranformation are also created two new tables: ga transactions and keyword ad group.

### DD: Data destination [OUT-MKT-SNOWFLAKE] 

The data destination loads data into a Snowflake database.

### FLOW: Flow [ADSPLATFORM-TO-SNOWFLAKE]

The flow runs marketing channels data source(s), snowflake transformation(s) and Snowflake data destination.

## Business Data Model





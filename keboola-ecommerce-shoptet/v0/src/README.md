# KEBOOLA-ECOMMERCE-SHOPTET

By using this end-to-end flow you can extract data from Shoptet and transform it into visualizations in your BI tool or anywhere else you prefer.

## Steps to take:
1. Fill out your credentials in the Shoptet data source
2. Optionaly select and authorize data destinations
3. Run the flow

## Included components' configurations:

Shoptet DS -> (marketing DS) -> TR1 -> TR2 -> DD -> FLOW


### DS: Data Source [IN-ECOMM-SHOPTET]

Shoptet data source collects data from Shoptet about the orders, products, inventory and customers.

### DS: Data Source [IN-ECOMM-FACEBOOK] OR [IN-ECOMM-GOOGLEADS] OR [IN-ECOMM-SKLIK]

Facebook ads, GoogleAds and Sklik are optionally data sources and can enrich Shoptet data with marketing data.

### TR1: Transformation1: Data Preparation [IN-ECOMM-SHOPTET]

Within this transformation, data is transformed. In this transformation, data is gathered, a stand-alone analysis is performed, a health check is run, and output tables are created.

### TR2: Transformation2: RFM Analysis [IN-ECOMM-SHOPTET] 

A basic RFM analysis is performed during this transformation.

### DD: Data Destination [OUT-ECOMM-GSHEET] OR [OUT-ECOMM-SNOWFLAKE] OR [OUT-ECOMM-BIGQUERY]

The data destination loads data into a Google sheet or a Snowflake database or a BigQuery database.

### FLOW: Flow [ECOMM-SHOPTET]

The Flow gets the data from Shoptet Data Source, transforms the data, runs the RFM analysis and optionally writes data into selected data destinations.


## Business Data Model




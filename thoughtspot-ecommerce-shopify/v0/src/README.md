# THOUGHTSPOT-ECOMMERCE-SHOPIFY

By using this end-to-end flow you can extract data from Shopify and transform it using the SpottApp for visualizations.

## Steps to take:
1. Fill out your credentials in the Shopify data source
2. Optionaly select and authorize data destinations
3. Run the flow

## Included components' configurations:

Shopify DS -> TR1 -> TR2 -> TR3 -> DD -> FLOW


### DS: Data Source [IN-ECOMM-SHOPIFY]

Shopify data source collects data from Shopify about the orders, products, inventory and customers.

### TR1: Transformation1: Prepare Input Tables [IN-ECOMM-SHOPIFY]

In this transformation, NULL values are populated in the output tables in case there are missing columns required for the following transformations. If these columns are not present, they are added to the output tables.

### TR2: Transformation2: Data Preparation [IN-ECOMM-SHOPIFY]

Within this transformation, data is transformed. In this transformation, data is gathered, a stand-alone analysis is performed, a health check is run, and output tables are created.

### TR3: Transformation3: RFM Analysis [IN-ECOMM-SHOPIFY]

A basic RFM analysis is performed during this transformation.

### DD: Data Destination [OUT-ECOMM-GSHEET] OR [OUT-ECOMM-SNOWFLAKE] OR [OUT-ECOMM-BIGQUERY]

The data destination loads data into Google Sheets, Snowflake database or BigQuery.

### FLOW: Flow [TS-ECOMM-SHOPIFY]

The Flow gets the data from Shopify Data Source, transforms the data, runs the RFM analysis and writes the data into Google sheet, Snowflake database or Google BigQuery.

## Business Data Model






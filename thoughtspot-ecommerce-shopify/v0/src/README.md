# THOUGHTSPOT-ECOMMERCE-SHOPIFY

By using this end-to-end flow you can extract data from Shopify and transform it using the SpottApp for visualizations.

## Steps to take:
1. Fill out your credentials in the Shopify data source
2. Optionaly select and authorize data destinations
3. Run the flow

## Included components' configurations:

Shopify SOURCE -> TR1 -> TR2 -> TR3 -> DESTINATION -> FLOW


### SOURCE: [IN-ECOMMERCE-SHOPIFY] Data Source

Shopify data source collects data from Shopify about the orders, products, inventory and customers.

### TR1: [IN-ECOMMERCE-SHOPIFY] Transformation1: Prepare Input Tables

In this Transformation, NULL values are populated in the output tables in case there are missing columns required for the following Transformations. If these columns are not present, they are added to the output tables.

### TR2: [IN-ECOMMERCE-SHOPIFY] Transformation2: Data Preparation

Within this transformation, data is transformed. In this transformation, data is gathered, a stand-alone analysis is performed, a health check is run, and output tables are created.

### TR3: [IN-ECOMMERCE-SHOPIFY] Transformation3: RFM Analysis

A basic RFM analysis is performed during this transformation.

### DESTINATION: [OUT-ECOMMERCE-GSHEET] Data Destination OR DESTINATION: [OUT-ECOMMERCE-SNOWFLAKE] Data Destination OR [OUT-ECOMMERCE-BIGQUERY] Data Destination 

The data destination loads data into Google Sheets, Snowflake database or BigQuery.

### FLOW: [IN-ECOMMERCE-SHOPIFY] Flow: BDM Creation

The Flow gets the data from Shopify Data Source, transforms the data, runs the RFM analysis and writes the data into Google sheet, Snowflake database or Google BigQuery.

## Business Data Model






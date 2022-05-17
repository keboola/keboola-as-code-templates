# KEBOOLA-ECOMMERCE-SHOPTET

By using this end-to-end flow you can extract data from Shoptet and transform it into visualizations in your BI tool or anywhere else you prefer.

## Steps to take:
1. Fill out your credentials in the Shoptet data source
2. Optionaly select and authorize writers
3. Run the flow

## Included components' configurations:

Shoptet SOURCE -> TR1 -> TR2 -> DESTINATION -> FLOW


### SOURCE: [IN-ECOMMERCE-SHOPTET] Data Source

Shoptet data source collects data from Shoptet about the orders, products, inventory and customers.

### TR1: [IN-ECOMMERCE-SHOPTET] Transformation1: Data Preparation

Within this transformation, data is transformed. In this transformation, data is gathered, a stand-alone analysis is performed, a health check is run, and output tables are created.

### TR2: [IN-ECOMMERCE-SHOPTET] Transformation2: RFM Analysis

A basic RFM analysis is performed during this transformation.

### DESTINATION: [OUT-ECOMMERCE-GSHEET] Data Destination OR DESTINATION: [OUT-ECOMMERCE-SNOWFLAKE] Data Destination OR DESTINATION: [OUT-ECOMMERCE-BIGQUERY] Data Destination

The data destination loads data into a Google sheet or a Snowflake database or a BigQuery database.

### FLOW: [KEBOOLA-ECOMMERCE-SHOPTET] Flow

The Orchestrator gets the data from Shoptet Data Source, transforms the data, runs the RFM analysis and optionally writes data into selected writers.


## Business Data Model




# KEBOOLA-ECOMMERCE-SHOPIFY

By using this end-to-end flow you can extract data from Shopify and transform it into visualizations in your BI tool or anywhere else you prefer.

## Steps to take:
1. Fill out your credentials in the Shopify extractor
2. Optionaly select and authorize writers
3. Run the orchestration

## Included components' configurations:

Shopify EX -> TR1 -> TR2 -> TR3 -> WR -> ORCH


### EX: [IN-ECOMMERCE-SHOPIFY] Extractor

Shopify extractor collects data from Shopify about the orders, products, inventory and customers.

### TR1: [IN-ECOMMERCE-SHOPIFY] Transformation1: Prepare Input Tables

In this Transformation, NULL values are populated in the output tables in case there are missing columns required for the following Transformations. If these columns are not present, they are added to the output tables.

### TR2: [IN-ECOMMERCE-SHOPIFY] Transformation2: Data Preparation

Within this transformation, data is transformed. In this transformation, data is gathered, a stand-alone analysis is performed, a health check is run, and output tables are created.

### TR3: [IN-ECOMMERCE-SHOPIFY] Transformation3: RFM Analysis

A basic RFM analysis is performed during this transformation.

### WR: [OUT-ECOMMERCE-GSHEET] Writer OR WR: [OUT-ECOMMERCE-SNOWFLAKE] Writer OR WR: [OUT-ECOMMERCE-BIGQUERY] Writer

The writer loads data into a Google sheet or a Snowflake database or a BigQuery database.

### ORCH: [KEBOOLA-ECOMMERCE-SHOPIFY] Orchestration

The Orchestrator gets the data from Shopify Extractor, transforms the data, runs the RFM analysis and optionally writes the data into selected writers.

## Business Data Model




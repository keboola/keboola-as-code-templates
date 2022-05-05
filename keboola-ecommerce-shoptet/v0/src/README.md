# KEBOOLA-ECOMMERCE-SHOPTET

By using this end-to-end flow you can extract data from Shoptet and transform it into visualizations in your BI tool or anywhere else you prefer.

## Steps to take:
1. Fill out your credentials in the Shoptet extractor
2. Optionaly select and authorize writers
3. Run the orchestration

## Included components' configurations:

Shoptet EX -> TR1 -> TR2 -> WR -> ORCH


### EX: [IN-ECOMMERCE-SHOPTET] Extractor

Shoptet extractor collects data from Shoptet about the orders, products, inventory and customers.

### TR1: [IN-ECOMMERCE-SHOPTET] Transformation1: Data Preparation

Within this transformation, data is transformed. In this transformation, data is gathered, a stand-alone analysis is performed, a health check is run, and output tables are created.

### TR2: [IN-ECOMMERCE-SHOPTET] Transformation2: RFM Analysis

A basic RFM analysis is performed during this transformation.

### WR: [OUT-ECOMMERCE-GSHEET] Writer OR WR: [OUT-ECOMMERCE-SNOWFLAKE] Writer OR WR: [OUT-ECOMMERCE-BIGQUERY] Writer

The writer loads data into a Google sheet or a Snowflake database or a BigQuery database.

### ORCH: [KEBOOLA-ECOMMERCE-SHOPTET] Orchestration

The Orchestrator gets the data from Shoptet Extractor, transforms the data, runs the RFM analysis and optionally writes data into selected writers.


## Business Data Model




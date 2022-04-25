# KEBOOLA-ECOMMERCE-SHOPTET

This is an end to end flow which is getting data from Shoptet and transform them so you can use them for visualisation in your BI tool or anywhere you want. 

## Steps to make:
1. Setting up shopify extractor: adding credentials
2. Setting up Snowflake database: create Snowflake database provided by Keboola
3. Run orchestration

## Included components' configurations:

Shoptet EX -> TR1 -> TR2 -> ORCH


### EX: [IN-ECOMMERCE-SHOPTET] Extractor

Extractor collects data from Shoptet about orders, products, inventory, and customers.

### TR1: [IN-ECOMMERCE-SHOPTET] Transformation1: Data Preparation

Data are transformed within this transformation. This transformation is gathering the data, doing stand alone analysis, healts check and creates output tables.

### TR2: [IN-ECOMMERCE-SHOPTET] Transformation2: RFM Analysis

Basic RFM analysis is done in this transformation.

### ORCH: [IN-ECOMMERCE-SHOPTET] Orchestration: BDM Creation

This orchestrator gets data from Shopify Extractor, transform them, run RFM analysis and write data into Snowflake database. 

### WR: [OUT-ECOMMERCE-GSHEET] Writer OR WR: [OUT-ECOMMERCE-SNOWFLAKE] Writer

Writer load data into a Google sheet or Snowflake database.

### ORCH: [OUT-ECOMMERCE-GSHEET] Orchestration: BDM Usage OR [OUT-ECOMMERCE-SNOWFLAKE] Orchestration: BDM Usage

This orchestration use writer to load created e-commerce BDM to Google sheet or Snowflake database.


## Business Data Model




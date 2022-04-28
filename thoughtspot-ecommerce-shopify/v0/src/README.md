# THOUGHTSPOT-ECOMMERCE-SHOPIFY

This is an end to end flow which is getting data from Shopify and transform them so you can use them for visualisation in spotApp.

## Steps to make:
1. Setting up shopify extractor: adding credentials
2. Run orchestration

## Included components' configurations:

Shopify EX -> TR1 -> TR2 -> TR3 -> WR -> ORCH


### EX: [IN-ECOMMERCE-SHOPIFY] Extractor

Extractor collect data from Shopify about orders, products, inventory, and customers.

### TR1: [IN-ECOMMERCE-SHOPIFY] Transformation1: Prepare Input Tables

The first transformation pre-create tables which don't have to be downloaded from extractor, but are needed for transformation, even if they don't contain any data.

### TR2: [IN-ECOMMERCE-SHOPIFY] Transformation2: Data Preparation

Data are transformed within this transformation. This transformation is gathering the data, doing stand alone analysis, healts check and creates output tables.

### TR3: [IN-ECOMMERCE-SHOPIFY] Transformation3: RFM Analysis

Basic RFM analysis is done in this transformation.

### ORCH: [IN-ECOMMERCE-SHOPIFY] Orchestration: BDM Creation

This orchestrator gets data from Shopify Extractor, transform them, run RFM analysis and write data into Snowflake database. 

### WR: [OUT-ECOMMERCE-GSHEET] Writer OR WR: [OUT-ECOMMERCE-SNOWFLAKE] Writer OR [OUT-ECOMMERCE-BIGQUERY] Writer 

Writer loads data into a Google sheet, Snowflake database or BigQuery.

### ORCH: [OUT-ECOMMERCE-GSHEET] Orchestration: BDM Usage OR [OUT-ECOMMERCE-SNOWFLAKE] Orchestration: BDM Usage OR [OUT-ECOMMERCE-BIGQUERY] Orchestration: BDM Usage

This orchestration use writer to load created BDM into Google sheet, Snowflake database or Google BigQuery.

## Business Data Model






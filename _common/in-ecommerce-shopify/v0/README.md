# IN-ECOMMERCE-SHOPIFY

This is an end to end flow which is getting data from Shopify and transform them so you can use them for visualisation in your BI tool or anywhere you want. 

## Steps to make:
1. Setting up shopify data source: adding credentials
2. Setting up Snowflake database: create Snowflake database provided by Keboola
3. Run flow

## Included components' configurations:

Shopify SOURCE -> TR1 -> TR2 -> TR3 -> FLOW


### SOURCE: [IN-ECOMMERCE-SHOPIFY] Data Source

Data Source collect data from Shopify about orders, products, inventory, and customers.

### TR1: [IN-ECOMMERCE-SHOPIFY] Transformation1: Prepare Input Tables

The first transformation pre-create tables which don't have to be downloaded from data source, but are needed for transformation, even if they don't contain any data.

### TR2: [IN-ECOMMERCE-SHOPIFY] Transformation2: Data Preparation

Data are transformed within this transformation. This transformation is gathering the data, doing stand alone analysis, healts check and creates output tables.

### TR3: [IN-ECOMMERCE-SHOPIFY] Transformation3: RFM Analysis

Basic RFM analysis is done in this transformation.

### FLOW: [IN-ECOMMERCE-SHOPIFY] Flow: BDM Creation

This orchestrator gets data from Shopify Data Source, transform them, run RFM analysis and write data into Snowflake database. 

## Business Data Model




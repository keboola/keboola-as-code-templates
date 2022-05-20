# IN-ECOMMERCE-SHOPTET

This is an end to end flow which is getting data from Shoptet and transform them so you can use them for visualisation in your BI tool or anywhere you want. 

## Steps to make:
1. Setting up shopify data source: adding credentials
2. Setting up Snowflake database: create Snowflake database provided by Keboola
3. Run flow

## Included components' configurations:

Shoptet SOURCE -> TR1 -> TR2 -> FLOW


### SOURCE: [IN-ECOMMERCE-SHOPTET] Data Source

Data Source collects data from Shoptet about orders, products, inventory, and customers.

### TR1: [IN-ECOMMERCE-SHOPTET] Transformation1: Data Preparation

Data are transformed within this transformation. This transformation is gathering the data, doing stand alone analysis, healts check and creates output tables.

### TR2: [IN-ECOMMERCE-SHOPTET] Transformation2: RFM Analysis

Basic RFM analysis is done in this transformation.

### FLOW: [IN-ECOMMERCE-SHOPTET] Flow: BDM Creation

This flow gets data from Shopify Data Source, transform them, run RFM analysis and write data into Snowflake database. 

## Business Data Model




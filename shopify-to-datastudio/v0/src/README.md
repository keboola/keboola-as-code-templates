# SHOPIFY-TO-DATASTUDIO

By using this end-to-end flow you can extract data from Shopify and transform it into visualizations in your BI tool or anywhere else you prefer.

## Steps to take:
1. Fill out your credentials in the Shopify data source
2. Authorize data destination
3. Run the flow

## Included components' configurations:

Shopify DS -> (marketing DS) -> TR1 -> TR2 -> TR3 -> DD -> FLOW


### DS: Data Source [IN-ECOMM-SHOPIFY]

Shopify data source collects data from Shopify about the orders, products, inventory and customers.

### DS: Data Source [IN-ECOMM-FACEBOOK] OR [IN-ECOMM-GOOGLEADS] OR [IN-ECOMM-SKLIK]

Facebook ads, GoogleAds and Sklik are optionally data sources and can enrich Shopify data with marketing data.

### TR1: Transformation1: Prepare Input Tables [IN-ECOMM-SHOPIFY] 

In this Transformation, NULL values are populated in the output tables in case there are missing columns required for the following Transformations. If these columns are not present, they are added to the output tables.

### TR2: Transformation2: Data Preparation [IN-ECOMM-SHOPIFY]

Within this transformation, data is transformed. In this transformation, data is gathered, a stand-alone analysis is performed, a health check is run, and output tables are created.

### TR3: Transformation3: RFM Analysis [IN-ECOMM-SHOPIFY]

A basic RFM analysis is performed during this transformation.

### DD: Data Destination [OUT-ECOMM-GSHEET-DATASTUDIO]

The data destination loads data into a Google sheet.

### FLOW: Flow [SHOPIFY-TO-DATASTUDIO] 

The Flow gets the data from Shopify Data Source, transforms the data, runs the RFM analysis and optionally writes the data into Google sheet.

## Business Data Model




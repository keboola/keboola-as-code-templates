# THOUGHTSPOT-HUBSPOT-SNOWFLAKE

This is an end to end flow for getting data from Hubspot and visualizing them in spotapp.

## Steps to make:
1. Fill API Token and Period from date in Hubspot extractor
2. Run orchestration

## Included components' configurations:

Hubspot EX -> TR -> WR –> ORCH


### EX: [THOUGHTSPOT-HUBSPOT-SNOWFLAKE] Extractor

This extractor is getting data from HubSpot. It's an incremental update.

### TR: [THOUGHTSPOT-HUBSPOT-SNOWFLAKE] Transformation: Data Preparation

The transformation is renaming and joining tables according to data model in spotapp.

### WR: [THOUGHTSPOT-HUBSPOT-SNOWFLAKE] Writer

Writer loads transformed data into Snowflake database.

### ORCH: [THOUGHTSPOT-HUBSPOT-SNOWFLAKE] Orchestration: BDM Creation

This orchestration includes Extractor, Transformation and Writer.

## Business Data Model


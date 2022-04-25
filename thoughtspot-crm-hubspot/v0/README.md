# THOUGHTSPOT-CRM-HUBSPOT

This is an end to end flow for getting data from Hubspot and transforming them.

## Steps to make:
1. Setup profile in extractor
2. Run orchestration

## Included components' configurations:
EX -> TR –> WR -> ORCH

### EX: [IN-THOUGHTSPOT-HUBSPOT] Extractor

This extractor is getting data from Hubspot. It's an incremental update.

### TR: [IN-THOUGHTSPOT-HUBSPOT] Transformation

This transformation is forming data from Hubspot into requested shape.

### ORCH: [IN-THOUGHTSPOT-HUBSPOT] Orchestration: BDM Creation

This orchestration includes Extractor and one transformation which prepare data for BDM model.

### WR: [OUT-THOUGHTSPOT-HUBSPOT-BIGQUERY] Writer OR WR: [OUT-THOUGHTSPOT-HUBSPOT-SNOWFLAKE] Writer

Writer load data into a Google BigQuery or Snowflake database.

### ORCH: [OUT-THOUGHTSPOT-HUBSPOT-BIGQUERY] Orchestration: BDM Usage OR [OUT-THOUGHTSPOT-HUBSPOT-SNOWFLAKE] Orchestration: BDM Usage

This orchestration use writer to load created BDM to Google BigQuery or Snowflake database.

## Business Data Model





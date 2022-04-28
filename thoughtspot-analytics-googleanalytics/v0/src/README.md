# THOUGHTSPOT-ANALYTICS-GOOGLEANALYTICS

This is an end to end flow for getting data from Google Analytics, transforming them and using them in SpotApp for visualisatins.

## Steps to make:
1. Setup profile in extractor
2. Run orchestration

## Included components' configurations:
EX -> TR –> ORCH

### EX: [IN-THOUGHTSPOT-GAA] Extractor

This extractor is getting data from Google Analytics. It's an incremental update.

### TR: [IN-THOUGHTSPOT-GAA] Transformation

This transformation is forming data from Google Analytics into requested shape.

### ORCH: [IN-THOUGHTSPOT-GAA] Orchestration: BDM Creation

This orchestration includes Extractor and one transformation which prepare data for BDM model.

### WR: [OUT-THOUGHTSPOT-GAA-BIGQUERY] Writer OR WR: [OUT-THOUGHTSPOT-GAA-SNOWFLAKE] Writer

Writer load data into a Google BigQuery or Snowflake database.

### ORCH: [OUT-THOUGHTSPOT-GAA-BIGQUERY] Orchestration: BDM Usage OR [OUT-THOUGHTSPOT-GAA-SNOWFLAKE] Orchestration: BDM Usage

This orchestration use writer to load created BDM to Google BigQuery or Snowflake database.

## Business Data Model



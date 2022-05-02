# KEBOOLA-ANALYTICS-GOOGLEANALYTICS

This is an end to end flow for getting data from Google Analytics, transforming them and using them in SpotApp for visualisatins.

## Steps to make:
1. Setup profile in extractor
2. Run orchestration

## Included components' configurations:
EX -> TR –> ORCH

### EX: [IN-GOOGLEANALYTICS] Extractor

This extractor is getting data from Google Analytics. It's an incremental update.

### TR: [IN-GOOGLEANALYTICS] Transformation

This transformation is forming data from Google Analytics into requested shape.

### EX: [IN-GOOGLEANALYTICS-SEARCHCONSOLE] Extractor

This extractor is getting data from Google Search Console.

### TR: [IN-GOOGLEANALYTICS-SEARCHCONSOLE] Transformation

Google search console results are grouped by URL and date. 

### WR: [OUT-GOOGLEANALYTICS-BIGQUERY] Writer OR WR: [OUT-GOOGLEANALYTICS-SNOWFLAKE] Writer

Writer load data into a Google BigQuery or Snowflake database.

## Business Data Model



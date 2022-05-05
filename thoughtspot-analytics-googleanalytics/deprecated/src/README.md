# THOUGHTSPOT-ANALYTICS-GOOGLEANALYTICS

By using this end-to-end flow you can extract data from Google Analytics and transform it using the SpottApp for visualizations.

## Steps to take:
1. Authorize extractor and setup profile
2. Optionaly select and authorize writers
3. Run the orchestration

## Included components' configurations:
EX -> TR –> WR -> ORCH

### EX: [IN-THOUGHTSPOT-GOOGLEANALYTICS] Extractor

The extractor gets the data from Google Analytics.

### TR: [IN-THOUGHTSPOT-GOOGLEANALYTICS] Transformation

Within this transformation, data is transformed. In this transformation, data is gathered from Google Analytics, and is shaped into the requested shape.

### EX: [IN-THOUGHTSPOT-GOOGLEANALYTICS-SEARCHCONSOLE] Extractor

This extractor is getting data from Google Search Console.

### TR: [IN-THOUGHTSPOT-GOOGLEANALYTICS-SEARCHCONSOLE] Transformation

Data from Google search console results are grouped by URL and date. 

### WR: [OUT-THOUGHTSPOT-GOOGLEANALYTICS-BIGQUERY] Writer OR WR: [OUT-THOUGHTSPOT-GOOGLEANALYTICS-SNOWFLAKE] Writer

The writer loads data into a Google BigQuery or a Snowflake database or a google sheet.

### ORCH: [THOUGHTSPOT-ANALYTICS-GOOGLEANALYTICS] Orchestration
The Orchestrator runs the Extractor and one transformation and optionally writes data into a Google BigQuery or a Snowflake databases.

## Business Data Model



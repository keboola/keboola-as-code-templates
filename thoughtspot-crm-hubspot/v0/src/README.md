# THOUGHTSPOT-CRM-HUBSPOT

By using this end-to-end flow you can extract data from HubSpot and transform it using the SpottApp for visualizations.

## Steps to take:
1. Authorize extractor with Hubspot API TOKEN and select date range
2. Optionaly select and authorize writers
3. Run the orchestration

## Included components' configurations:
EX -> TR –> WR -> ORCH

### EX: [IN-THOUGHTSPOT-HUBSPOT] Extractor

The extractor gets the data from HubSpot.

### TR: [IN-THOUGHTSPOT-HUBSPOT] Transformation

Within this transformation, data is transformed. In this transformation, data is gathered from HubSpot, and is shaped into the requested shape.

### WR: [OUT-THOUGHTSPOT-HUBSPOT-BIGQUERY] Writer OR WR: [OUT-THOUGHTSPOT-HUBSPOT-SNOWFLAKE] Writer

The writer loads data into a Google BigQuery or a Snowflake database.

### ORCH: [THOUGHTSPOT-CRM-HUBSPOT] Orchestration

The Orchestrator runs the Extractor and one transformation and optionally selected writers.

## Business Data Model





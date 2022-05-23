# THOUGHTSPOT-CRM-HUBSPOT

By using this end-to-end flow you can extract data from HubSpot and transform it using the SpottApp for visualizations.

## Steps to take:
1. Authorize data source with Hubspot API TOKEN and select date range
2. Optionaly select and authorize data destinations
3. Run the flow

## Included components' configurations:
SOURCE -> TRANSFORMATION –> DESTINATION -> FLOW

### SOURCE: [IN-THOUGHTSPOT-HUBSPOT] Data Source

The data source gets the data from HubSpot.

### TRANSFORMATION: [IN-THOUGHTSPOT-HUBSPOT] Transformation

Within this transformation, data is transformed. In this transformation, data is gathered from HubSpot, and is shaped into the requested shape.

### DESTINATION: [OUT-THOUGHTSPOT-HUBSPOT-BIGQUERY] Data Destination OR DESTINATION: [OUT-THOUGHTSPOT-HUBSPOT-SNOWFLAKE] Data Destination

The data destination loads data into a Google BigQuery or a Snowflake database.

### FLOW: [THOUGHTSPOT-CRM-HUBSPOT] Flow

The Flow runs the Data Source and one transformation and optionally selected data destinations.

## Business Data Model





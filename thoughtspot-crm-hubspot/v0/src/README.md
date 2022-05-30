# THOUGHTSPOT-CRM-HUBSPOT

By using this end-to-end flow you can extract data from HubSpot and transform it using the SpottApp for visualizations.

## Steps to take:
1. Authorize data source with Hubspot API TOKEN and select date range
2. Optionaly select and authorize data destinations
3. Run the flow

## Included components' configurations:
DS -> TR –> DD -> FLOW

### DS: Data Source [IN-TS-HUBSPOT]

The data source gets the data from HubSpot.

### TR: Transformation [IN-TS-HUBSPOT] 

Within this transformation, data is transformed. In this transformation, data is gathered from HubSpot, and is shaped into the requested shape.

### DD: Data Destination [OUT-TS-HUBSPOT-BIGQUERY] OR [OUT-TS-HUBSPOT-SNOWFLAKE]

The data destination loads data into a Google BigQuery or a Snowflake database.

### FLOW: Flow [TS-CRM-HUBSPOT] 

The Flow runs the Data Source and one transformation and optionally selected data destinations.

## Business Data Model





# KEBOOLA-COSTS

By using this end-to-end flow you can extract data from Telemetry data about all your Keboola project. This data is transformed for vizualization in your BI tool and loaded into a Snowflake database or Google Sheets.

## Steps to take:
1. Authorize data destination(s)
2. Run the flow

## All possible included components' configurations:

DS -> TR -> DD -> FLOW


### DS: Telemetry Keboola Costs

The data is extracted from this Keboola project only.

### TR: Transformation Keboola Costs

Data from Telemetry is prepared to be used for vizualization, within this transformation.

### DD: Snowflake Keboola Costs

The writer loads data into a Snowflake database.

### DD: Google Sheet Keboola Costs

The writer loads data into a Google Sheets.

### FLOW: Flow [KEBOOLA-COSTS]

The flow runs Telemetry data source, one snowflake transformation and Snowflake or Google Sheets data destination.


## Business Data Model








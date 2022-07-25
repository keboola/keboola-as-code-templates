# KEBOOLA-COSTS

By using this end-to-end flow you can extract data from Telemetry data about all your Keboola project. This data is transformed for vizualization in your BI tool and loaded into a Snowflake database.

## Steps to take:
1. Authorize data destination
2. Run the flow

## All possible included components' configurations:

DS -> TR -> DD -> FLOW


### DS: Telemetry Keboola Costs

The data is extracted from this Keboola project only.

### TR: Transformation Keboola Costs

Data from Telemetry is prepared to be used for vizualization, within this transformation.

### DD: Snowflake Keboola Costs

The writer loads data into a Snowflake database.

### FLOW: Flow [KEBOOLA-COSTS]

The flow runs Telemetry data source, one snowflake transformation and Snowflake data destination.


## Business Data Model










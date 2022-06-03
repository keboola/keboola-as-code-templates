# KEBOOLA-ANALYTICS-GOOGLEANALYTICS

By using this end-to-end flow you can extract data from Google Analytics and transform it using the SpottApp for visualizations.

## Steps to take:
1. Authorize data source and setup profile
2. Optionaly select and authorize data destinations
3. Run the flow

## Included components' configurations:

Google analytics DS -> TR –> DD -> FLOW

### DS: Data Source [IN-GA-GOOGLEANALYTICS]

The data source gets the data from Google Analytics.

### TR: Transformation [IN-GA-GOOGLEANALYTICS] 

Within this transformation, data is transformed. In this transformation, data is gathered from Google Analytics, and is shaped into the requested shape.

### DD: Data Destination [OUT-GA-SNOWFLAKE]

The data destination loads data into a Snowflake database.

### FLOW: Flow [TS-GA-GOOGLEANALYTICS]

The Flow runs the Data Source and one transformation and optionally writes data into a snowflake database.




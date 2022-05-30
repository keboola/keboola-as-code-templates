# KEBOOLA-ANALYTICS-GOOGLEANALYTICS

By using this end-to-end flow you can extract data from Google Analytics and transform it using the SpottApp for visualizations.

## Steps to take:
1. Authorize data source and setup profile
2. Optionaly select and authorize data destinations
3. Run the flow

## Included components' configurations:
DS -> TR –> DD -> FLOW

### DS: Data Source [IN-GA-GOOGLEANALYTICS] 

The data source gets the data from Google Analytics.

### TR: Transformation [IN-GA-GOOGLEANALYTICS] 

Within this transformation, data is transformed. In this transformation, data is gathered from Google Analytics, and is shaped into the requested shape.

### DS: Data Source [IN-GA-SEARCHCONSOLE]

This data source is getting data from Google Search Console.

### TR: Transformation [IN-GA-SEARCHCONSOLE]

Data from Google search console results are grouped by URL and date. 

### DD: Data Destination [OUT-GA-BIGQUERY]  OR [OUT-GA-SNOWFLAKE] OR [OUT-GA-GSHEET]

The data destination loads data into a Google BigQuery or a Snowflake database or a google sheet.

### FLOW: Flow [GA-GOOGLEANALYTICS]
The Flow runs the Data Source and one transformation and optionally writes data into a Google BigQuery or a Snowflake databases or a google sheet.

## Business Data Model



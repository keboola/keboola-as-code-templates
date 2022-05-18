# KEBOOLA-ANALYTICS-GOOGLEANALYTICS

By using this end-to-end flow you can extract data from Google Analytics and transform it using the SpottApp for visualizations.

## Steps to take:
1. Authorize data source and setup profile
2. Optionaly select and authorize writers
3. Run the flow

## Included components' configurations:
SOURCE -> TRANSFORMATION –> DESTINATION -> FLOW

### SOURCE: [IN-GOOGLEANALYTICS] Data Source

The data source gets the data from Google Analytics.

### TRANSFORMATION: [IN-GOOGLEANALYTICS] Transformation

Within this transformation, data is transformed. In this transformation, data is gathered from Google Analytics, and is shaped into the requested shape.

### SOURCE: [IN-GOOGLEANALYTICS-SEARCHCONSOLE] Data Source

This data source is getting data from Google Search Console.

### TRANSFORMATION: [IN-GOOGLEANALYTICS-SEARCHCONSOLE] Transformation

Data from Google search console results are grouped by URL and date. 

### DESTINATION: [OUT-GOOGLEANALYTICS-BIGQUERY] Data Destination OR DESTINATION: [OUT-GOOGLEANALYTICS-SNOWFLAKE] Data Destination OR DESTINATION: [OUT-GOOGLEANALYTICS-GSHEET] Data Destination

The data destination loads data into a Google BigQuery or a Snowflake database or a google sheet.

### FLOW: [KEBOOLA-ANALYTICS-GOOGLEANALYTICS] Flow
The Orchestrator runs the Data Source and one transformation and optionally writes data into a Google BigQuery or a Snowflake databases or a google sheet.

## Business Data Model



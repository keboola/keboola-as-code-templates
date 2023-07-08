# KEBOOLA-TYPEFORM

By using this end-to-end flow you can extract data from Typeform and transform it into visualizations in your BI tool or anywhere else you prefer.

## Steps to take:
1. Authorize Typeform data source
2. Optionaly select and authorize data destinations
3. Run the flow

## Included components' configurations:

DS -> TR -> DD -> FLOW


### DS: Data Source [IN-TYPEFORM]

Typeform extracts and produces data such as list of forms, basic form statistics, list of questions, responses. 

### TR: Transformation [IN-TYPEFORM] 

Within this transformation are prepared four tables (survey, questions, answer option, responses).

### DD: Data Destination [OUT-TYPEFORM-SNOWFLAKE]  OR [OUT-TYPEFORM-BIGQUERY] OR [OUT-TYPEFORM-GSHEET]

The data destination loads data into a Snowflake database or a BigQuery database or a Google sheet.

### FLOW: Flow [TYPEFORM] 

The Flow gets the data from Typeform data source, transforms the data and optionally writes the data into selected data destinations.

## Business Data Model







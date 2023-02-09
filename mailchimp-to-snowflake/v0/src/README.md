# MAILCHIMP-TO-SNOWFLAKE

By using this end-to-end flow you can extract data from Mailchimp and transform it into visualizations in your BI tool or anywhere else you prefer.

## Steps to take:
1. Authorize Mailchimp data source
2. Authorize data destination
3. Run the flow

## Included components' configurations:

DS1 -> DS2 -> TR -> DD -> FLOW


### DS: Data Source1 [IN-MAILCHIMP]

This data source extracts data from mailing lists sent by the Mailchimp service. It downloads configured reports for all specified accounts, importing data about campaigns.

### DS: Data Source2 [IN-MAILCHIMP]

This data source extracts data from mailing lists sent by the Mailchimp service. It downloads configured reports for all specified accounts, importing data about lists and members.

### TR: Transformation [IN-MAILCHIMP] 

Within this transformation are prepared five tables (campaign, campaign-event, customer, list, list-member).

### DD: Data Destination [OUT-MAILCHIMP-SNOWFLAKE]

The data destination loads data into a Snowflake database.

### FLOW: Flow [KEBOOLA-MAILCHIMP] 

The Flow gets the data from Mailchimp Data Source, transforms the data and optionally writes the data into a Snowflake database.

## Business Data Model






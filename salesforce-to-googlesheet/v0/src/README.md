# SALESFORCE-TO-GOOGLESHEET

By using this end-to-end flow you can extract data from Salesforce and transform it into visualizations in your BI tool or anywhere else you prefer.

## Steps to take:
1. Fill out your password and security token in the Salesforce data source
2. Authorize data destination
3. Run the flow

## All possible Included components' configurations:

Salesforce DS -> TR1 -> TR2 -> TR3 -> DD -> FLOW


### DS: Data Source [IN-CRM-SALESFORCE]

Salesforce data is extracted with this data source. The data source will be taking the following data: accounts, contacts, events, leads, opportunities, opportunity contact roles, opportunity stages and user information.

### TR1: Transformation1: Input Tables Creation [IN-CRM-SALESFORCE]

In this Transformation, NULL values are populated in the output tables in case there are missing columns required for the following Transformations. If these columns are not present, they are added to the output tables.

### TR2: Transformation2: Main [IN-CRM-SALESFORCE]

From Salesforce data, the second transformation creates an output CRM data model (set of output tables). There are three phases to the transformation. In the first phase of the process, 3 tables are created (out_company, out_contact, out_employee). Second phase creates an opportunity table by combining other tables (out_employee, out_company, opportunity_stage). The third phase then creates the out_activity table using the first contact/opportunity/employee IDs from the activities by joining the table; this also outputs a pairing table for opportunities and contacts are created.

### TR3: Transformation3: Snapshots [IN-CRM-SALESFORCE]

The final snapshots are generated from the auxiliary tables.

### DD: Data Destination [OUT-CRM-GSHEET]

The data destination loads data into a Google sheet.

### FLOW: Flow [SALESFORCE-TO-GOOGLESHEET]

The Flow runs Salesforce CRM data source, three snowflake transformations and Google sheet data destinations.

## Business Data Model


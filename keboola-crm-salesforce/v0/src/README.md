# KEBOOLA-CRM-SALESFORCE

By using this end-to-end flow you can extract data from Salesforce and transform it into visualizations in your BI tool or anywhere else you prefer.

## Steps to take:
1. Fill out your password and security token in the Salesforce data source
2. Optionaly select and authorize data destinations
3. Run the flow

## All possible Included components' configurations:

Salesforce SOURCE -> TR1 -> TR2 -> TR3 -> DESTINATION -> FLOW


### SOURCE: [IN-CRM-SALESFORCE] Data Source

Salesforce data is extracted with this data source. The data source will be taking the following data: accounts, contacts, events, leads, opportunities, opportunity contact roles, opportunity stages and user information.

### TR1: [IN-CRM-SALESFORCE] Transformation1: Input Tables Creation

In this Transformation, NULL values are populated in the output tables in case there are missing columns required for the following Transformations. If these columns are not present, they are added to the output tables.

### TR2: [IN-CRM-SALESFORCE] Transformation2: Main

From Salesforce data, the second transformation creates an output CRM data model (set of output tables). There are three phases to the transformation. In the first phase of the process, 3 tables are created (out_company, out_contact, out_employee). Second phase creates an opportunity table by combining other tables (out_employee, out_company, opportunity_stage). The third phase then creates the out_activity table using the first contact/opportunity/employee IDs from the activities by joining the table; this also outputs a pairing table for opportunities and contacts are created.

### TR3: [IN-CRM-SALESFORCE] Transformation3: Snapshots

The final snapshots are generated from the auxiliary tables.

### DESTINATION: [OUT-CRM-GSHEET] Data Destination OR DESTINATION: [OUT-CRM-SNOWFLAKE] Data Destination

The data destination loads data into a Google sheet or a Snowflake database.

### FLOW: [IN-CRM-SALESFORCE] Flow: BDM Creation

The Flow runs Salesforce CRM data source, three snowflake transformations and optionally selected data destinations.

## Business Data Model


# HUBSPOT-TO-SNOWFLAKE

By using this end-to-end flow you can extract data from Hubspot, transform it and load it into snowflake database.

## Steps to take:
1. Authorize data source with Hubspot API TOKEN and select date range
2. Authorize data destination
3. Run the flow

## All possible included components' configurations:

Hubspot DS -> TR1 -> TR2 -> TR3 -> DD -> FLOW


### DS: Data Source [IN-CRM-HUBSPOT]

HubSpot data is extracted with this data source. In this incremental update the data source is taking the following data: companies, activities, lists, owners, contacts, deals and pipelines.

### TR1: Transformation1: Input Tables Creation [IN-CRM-HUBSPOT]

In this Transformation, NULL values are populated in the output tables in case there are missing columns required for the following Transformations. If these columns are not present, they are added to the output tables.

### TR2: Transformation2: Main [IN-CRM-HUBSPOT]

From Hubspot data, the second transformation creates an output CRM data model (set of output tables). There are three phases to the transformation. In the first phase of the process, 3 tables are created (out_company, out_contact, out_employee). Second phase creates an opportunity table by combining other tables (pipelines, stages, out_employee, deals_companies, out_company). The third phase then creates the out_activity table using the first contact/opportunity/employee IDs from the activities by joining the table; this also outputs a pairing table for opportunities and contacts are created.

### TR3: Transformation3: Snapshots [IN-CRM-HUBSPOT]

The final snapshots are generated from the auxiliary tables.

### DD: Data Destination [OUT-CRM-SNOWFLAKE]

The data destination loads data into a Snowflake database.

### FLOW: Flow [HUBSPOT-TO-SNOWFLAKE]

The Flow runs HubSpot CRM data source, three snowflake transformations and snowflake data destination.


## Business Data Model




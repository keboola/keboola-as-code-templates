# PIPEDRIVE-TO-SNOWFLAKE

By using this end-to-end flow you can extract data from Hubspot, transform it and load it into a Snowflake database.

## Steps to take:
1. Authorize data source with Pipedrive API TOKEN and fill company domain
2. Authorize data destination
3. Run the flow

## All possible included components' configurations:

Pipedrive DS -> TR1 -> TR2 -> TR3 -> DD -> FLOW


### DS: Data Source [IN-CRM-PIPEDRIVE]

Pipedrive data is extracted with this extractor. In this incremental update the extractor is taking the following data: companies, activities, lists, owners, contacts, deals and pipelines.

### TR1: Transformation1: Input Tables Creation [IN-CRM-PIPEDRIVE]

In this transformation, NULL values are populated in the output tables in case there are missing columns required for the following transformations. If these columns are not present, they are added to the output tables.

### TR2: Transformation2: Main [IN-CRM-PIPEDRIVE]

From Pipedrive data, the second transformation creates an output CRM data model (set of output tables). There are two phases to the transformation. In the first phase of the process, 3 tables are created (out_company, out_contact, out_employee). Second phase creates an out_opportunity table by combining other tables (pipelines, stages, out_employee, deals_companies, out_company) and there is also created snapshot of the output table to track changes throughout time.

### TR3: Transformation3: Snapshots [IN-CRM-PIPEDRIVE]

The third transformation then creates the out_activity table using the first contact/opportunity/employee IDs from the activities by joining the table; this also outputs a pairing table for opportunities and contacts are created.
The final snapshots are generated from the auxiliary tables.

### DD: Data Destination [OUT-CRM-SNOWFLAKE]

The writer loads data into a Snowflake database.

### FLOW: Flow [PIPEDRIVE-TO-SNOWFLAKE]

The flow runs Pipedrive CRM data source, three snowflake transformations and Snowflake data destination.


## Business Data Model






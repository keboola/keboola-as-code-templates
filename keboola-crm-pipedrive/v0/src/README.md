# KEBOOLA-CRM-PIPEDRIVE

By using this end-to-end flow you can extract data from Pipedrive and transform it into visualizations in your BI tool or anywhere else (currently into a Google sheet and Snowflake).

## Steps to take:
1. Authorize data source with Pipedrive API TOKEN and fill company domain
2. Optionaly select and authorize data destination(s)
3. Run the flow

## All possible included components' configurations:

Pipedrive DS -> TR1 -> TR2 -> TR3 -> DD -> FLOW


### DS: [KEBOOLA-CRM-PIPEDRIVE] Data Source

Pipedrive data is extracted with this extractor. In this incremental update the extractor is taking the following data: companies, activities, lists, owners, contacts, deals and pipelines.

### TR1: [KEBOOLA-CRM-PIPEDRIVE] Transformation1: Input Tables Creation

In this transformation, NULL values are populated in the output tables in case there are missing columns required for the following transformations. If these columns are not present, they are added to the output tables.

### TR2: [KEBOOLA-CRM-PIPEDRIVE] Transformation2: Main

From Pipedrive data, the second transformation creates an output CRM data model (set of output tables). There are two phases to the transformation. In the first phase of the process, 3 tables are created (out_company, out_contact, out_employee). Second phase creates an out_opportunity table by combining other tables (pipelines, stages, out_employee, deals_companies, out_company) and there is also created snapshot of the output table to track changes throughout time.

### TR3: [KEBOOLA-CRM-PIPEDRIVE] Transformation3: Snapshots

The third transformation then creates the out_activity table using the first contact/opportunity/employee IDs from the activities by joining the table; this also outputs a pairing table for opportunities and contacts are created.
The final snapshots are generated from the auxiliary tables.

### DD: [OUT-CRM-GSHEET]  OR [OUT-CRM-SNOWFLAKE] Data Destination

The writer loads data into a Google sheet or a Snowflake database.

### ORCH: [KEBOOLA-CRM-HUBSPOT] Flow

The flow runs Pipedrive CRM data source, three snowflake transformations and optionally selected data destinations.


## Business Data Model






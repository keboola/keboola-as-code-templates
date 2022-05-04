# KEBOOLA-CRM-HUBSPOT

By using this end-to-end flow you can extract data from Hubspot and transform it into visualizations in your BI tool or anywhere else (currently into a Google sheet and snowflake).

## Steps to take:
1. Authorize extractor with Hubspot API TOKEN and select date range
2. Optionaly select and authorize writers
3. Run the orchestration

## All possible included components' configurations:

Hubspot EX -> TR1 -> TR2 -> TR3 -> WR -> ORCH


### EX: [IN-CRM-HUBSPOT] Extractor

HubSpot data is extracted with this extractor. In this incremental update the extractor is taking the following data: companies, activities, lists, owners, contacts, deals and pipelines.

### TR1: [IN-CRM-HUBSPOT] Transformation1: Input Tables Creation

In this Transformation, NULL values are populated in the output tables in case there are missing columns required for the following Transformations. If these columns are not present, they are added to the output tables.

### TR2: [IN-CRM-SALESFORCE] Transformation2: Main

From Hubspot data, the second transformation creates an output CRM data model (set of output tables). There are three phases to the transformation. In the first phase of the process, 3 tables are created (out_company, out_contact, out_employee). Second phase creates an opportunity table by combining other tables (pipelines, stages, out_employee, deals_companies, out_company). The third phase then creates the out_activity table using the first contact/opportunity/employee IDs from the activities by joining the table; this also outputs a pairing table for opportunities and contacts are created.

### TR3: [IN-CRM-SALESFORCE] Transformation3: Snapshots

The final snapshots are generated from the auxiliary tables.

### ORCH: [IN-CRM-SALESFORCE] Orchestration: BDM Creation

Orchestrator runs HubSpot CRM extractor and 3 snowflake transformations.

### WR: [OUT-CRM-GSHEET] Writer OR WR: [OUT-CRM-SNOWFLAKE] Writer

The writer loads data into a Google sheet or a Snowflake database.

### ORCH: [KEBOOLA-CRM-HUBSPOT] Orchestration

The Orchestrator runs HubSpot CRM extractor, three snowflake transformations and optionally selected writers.


## Business Data Model




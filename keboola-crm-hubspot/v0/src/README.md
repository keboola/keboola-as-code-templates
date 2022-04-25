# KEBOOLA-CRM-HUBSPOT

This is an end to end flow which is getting data from Hubspot and transform them so you can use them for visualisation in your BI tool or anywhere you want (currently into a Google sheet and snowflake).

## Steps to make:
1. Authorise extractor with API TOKEN
2. Select date range
3. Run orchestration

## Included components' configurations:

Hubspot EX -> TR1 -> TR2 -> TR3 -> WR -> ORCH


### EX: [IN-CRM-HUBSPOT] Extractor

This extractor is getting data from HubSpot. It's an incremental update and the extractor is taking data about: companies, activities, lists, owners, contacts, deals and pipelines.

### TR1: [IN-CRM-HUBSPOT] Transformation1: Input Tables Creation

This Transformation checks for missing columns needed in the following Transformations, adding them to the output tables and populating them with NULL values if missing.

### TR2: [IN-CRM-SALESFORCE] Transformation2: Main

The second transformation creates output CRM data model (set of the output tables) from data extracted from Hubspot. It is divided into 3 phases.
The first phase creates 3 tables (out_company, out_contact, out_employee). The second phase creates opportunity table by joining with other tables (pipelines, stages, out_employee, deals_companies, out_company).
And the third phase creates out_activity table using the first contact/opportunity/employee ID in array from activities table for joins. And also output paring table for opportunities and contacts is created.

### TR3: [IN-CRM-SALESFORCE] Transformation3: Snapshots

Creation of final snapshots from the auxiliary tables.

### ORCH: [IN-CRM-SALESFORCE] Orchestration: BDM Creation

Orchestrator runs HubSpot CRM extractor and 3 snowflake transformations.

### WR: [OUT-CRM-GSHEET] Writer OR WR: [OUT-CRM-SNOWFLAKE] Writer

Writer load data into a Google sheet or snowflake database.

### ORCH: [OUT-CRM-GSHEET] Orchestration: BDM Usage OR [OUT-CRM-SNOWFLAKE] Orchestration: BDM Usage

This orchestration use writer to load created CRM BDM to Google sheet or snowflake database.


## Business Data Model




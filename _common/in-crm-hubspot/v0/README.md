# IN-CRM-HUBSPOT

This is an end to end flow which is getting data from Hubspot and transform them so you can use them for visualisation in your BI tool or anywhere you want. 

## Steps to make:
1. Authorise data source with API TOKEN
2. Select date range
3. Run flow

## Included components' configurations:

Hubspot SOURCE -> TR1 -> TR2 -> TR3 -> FLOW


### SOURCE: [IN-CRM-HUBSPOT] Data Source

This data source is getting data from HubSpot. It's an incremental update and the data source is taking data about: companies, activities, lists, owners, contacts, deals and pipelines.

### TR1: [IN-CRM-HUBSPOT] Transformation1: Input Tables Creation

This Transformation checks for missing columns needed in the following Transformations, adding them to the output tables and populating them with NULL values if missing.

### TR2: [IN-CRM-SALESFORCE] Transformation2: Main

The second transformation creates output CRM data model (set of the output tables) from data extracted from Hubspot. It is divided into 3 phases.
The first phase creates 3 tables (out_company, out_contact, out_employee). The second phase creates opportunity table by joining with other tables (pipelines, stages, out_employee, deals_companies, out_company).
And the third phase creates out_activity table using the first contact/opportunity/employee ID in array from activities table for joins. And also output paring table for opportunities and contacts is created.

### TR3: [IN-CRM-SALESFORCE] Transformation3: Snapshots

Creation of final snapshots from the auxiliary tables.

### FLOW: [IN-CRM-SALESFORCE] Flow: BDM Creation

Orchestrator runs HubSpot CRM data source and 3 snowflake transformations.

## Business Data Model


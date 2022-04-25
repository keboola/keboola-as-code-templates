# KEBOOLA-CRM-SALESFORCE

This is an end to end flow which is getting data from salesforce and transform them so you can use them for visualisation in your BI tool or anywhere you want.

## Steps to make:
1. Fill password and security token in Salesforce extractor
2. Run orchestration

## Included components' configurations:

Salesforce EX -> TR1 -> TR2 -> TR3 -> ORCH


### EX: [IN-CRM-SALESFORCE] Extractor

This extractor is getting data about account, contact, event, lead, opportunity, opportunity contact role, opportunity stage and user from Salesforce.

### TR1: [IN-CRM-SALESFORCE] Transformation1: Input Tables Creation

This Transformation checks for missing columns needed in the following Transformations, adding them to the output tables and populating them with NULL values if missing.

### TR2: [IN-CRM-SALESFORCE] Transformation2: Main

This transformation creates output CRM data model (set of the output tables) from data which were extracted from Salesforce. It is divided into 3 phases. The first phase creates 3 tables (out_company, out_contact, out_employee). The second phase creates opportunity table by joining the other tables (out_employee, out_company, opportunity_stage). And the third phase creates out_activity table using the first contact/opportunity/employee ID in array from activities table for joins. And also output paring table for opportunities and contacts is created.

### TR3: [IN-CRM-SALESFORCE] Transformation3: Snapshots

Creation of final snapshots from the auxiliary tables.

### ORCH: [IN-CRM-SALESFORCE] Orchestration: BDM Creation

This orchestrator runs Salesforce CRM extractor and 3 Snowflake transformations.

### WR: [OUT-CRM-GSHEET] Writer OR WR: [OUT-CRM-SNOWFLAKE] Writer

Writer load data into a Google sheet or Snowflake database.

### ORCH: [OUT-CRM-GSHEET] Orchestration: BDM Usage OR [OUT-CRM-SNOWFLAKE] Orchestration: BDM Usage

This orchestration use writer to load created CRM BDM to Google sheet or Snowflake database.


## Business Data Model


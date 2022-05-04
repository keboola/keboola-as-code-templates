# KEBOOLA-CRM-SALESFORCE

By using this end-to-end flow you can extract data from Salesforce and transform it into visualizations in your BI tool or anywhere else you prefer.

## Steps to take:
1. Fill out your password and security token in the Salesforce extractor
2. Optionaly select and authorize writers
3. Run the orchestration

## All possible Included components' configurations:

Salesforce EX -> TR1 -> TR2 -> TR3 -> WR -> ORCH


### EX: [IN-CRM-SALESFORCE] Extractor

Salesforce data is extracted with this extractor. The extractor will be taking the following data: accounts, contacts, events, leads, opportunities, opportunity contact roles, opportunity stages and user information.

### TR1: [IN-CRM-SALESFORCE] Transformation1: Input Tables Creation

In this Transformation, NULL values are populated in the output tables in case there are missing columns required for the following Transformations. If these columns are not present, they are added to the output tables.

### TR2: [IN-CRM-SALESFORCE] Transformation2: Main

From Salesforce data, the second transformation creates an output CRM data model (set of output tables). There are three phases to the transformation. In the first phase of the process, 3 tables are created (out_company, out_contact, out_employee). Second phase creates an opportunity table by combining other tables (out_employee, out_company, opportunity_stage). The third phase then creates the out_activity table using the first contact/opportunity/employee IDs from the activities by joining the table; this also outputs a pairing table for opportunities and contacts are created.

### TR3: [IN-CRM-SALESFORCE] Transformation3: Snapshots

The final snapshots are generated from the auxiliary tables.

### WR: [OUT-CRM-GSHEET] Writer OR WR: [OUT-CRM-SNOWFLAKE] Writer

The writer loads data into a Google sheet or a Snowflake database.

### ORCH: [IN-CRM-SALESFORCE] Orchestration: BDM Creation

The Orchestrator runs Salesforce CRM extractor, three snowflake transformations and optionally selected writers.

## Business Data Model


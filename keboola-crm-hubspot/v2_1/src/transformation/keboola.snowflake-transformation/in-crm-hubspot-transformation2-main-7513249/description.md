## Description:
Creates output CRM data model (set of the output tables) from data extracted from Hubspot.
It is divided into 3 phases. 

The first phase creates 3 tables (out_company, out_contact, out_employee). 

The second phase creates  opportunity table by joining with other tables (pipelines, stages, out_employee, deals_companies, out_company). 

And the third phase creates out_activity table using the first contact/opportunity/employee ID in array from activities table for joins. And also output paring table for opportunities and contacts is created.

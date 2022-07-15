# HubSpot to Google Sheets

The process is simple. We will guide you through it, and, when needed, ask you to provide your credentials, select a date range, and authorize the source and destination components.
 
## The flow, in a nutshell
First, the HubSpot CRM source component will collect data from your HubSpot account (companies, deals, activities, lists, owners, contacts, and pipelines). 

We then add NULL values if any columns are missing, and create an output CRM data model (a set of output tables). 

The data will be written into a Google Sheets account via the Google Sheets destination component.
 
Finally, you will schedule and run the entire flow (i.e., the sequence of all the prepared, above mentioned steps, in the correct order). The source component, all data manipulations, and the Google Sheets destination component, will be processed.




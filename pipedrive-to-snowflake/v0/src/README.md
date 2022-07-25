The process is simple. We will guide you through it, and, when needed, ask you to provide your credentials, and authorize the source and destination components.

The flow, in a nutshell:

- First, the Pipedrive source component will collect data from your Pipedrive account (companies, deals, activities, lists, owners, contacts, and pipelines).

- We then add NULL values if any columns are missing, and create an output CRM data model (a set of output tables).

- The data will be written into a Snowflake database via the Snowflake destination component.

- Finally, you will schedule and run the entire flow (i.e., the sequence of all the prepared, above mentioned steps, in the correct order). The Pipedrive source component, all data manipulations, and the Snowflake destination component, will be processed.

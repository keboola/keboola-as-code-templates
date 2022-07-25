The process is simple. We will guide you through it, and, when needed, ask you to provide your credentials and authorize the source and destination components.
 
The flow, in a nutshell:

- First, the Asana source component will collect data from your Asana account about projects and tasks.

- We then create the output tables and snapshots.

-The data is then written into a Snowflake database via the Snowflake destination component.

- Finally, you will schedule and run the entire flow (i.e., the sequence of all the prepared, above mentioned steps, in the correct order). The Asana source component, all data manipulations, and the Snowflake destination component, will be processed.

The process is simple. We will guide you through it, and, when needed, ask you to provide your credentials, and authorize the source and destination components.
 
The flow, in a nutshell: 
 
- First, the Telemetry source component will collect data only from this Keboola Connection project.

- Then we prepare the data for visualization.

- The data is then written into a Snowflake database via the Snowflake destination component or into a Google sheet via the Google Sheets destination component.

- Finally, you will schedule and run the entire flow (i.e., the sequence of all the prepared, above mentioned steps, in the correct order). The Telemetry source component, all data manipulations, and the Snowflake or Google Sheets destination components (if selected), will be processed.

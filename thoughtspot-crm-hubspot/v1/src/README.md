Upon selecting this template, you will be asked for your [Hubspot token](https://knowledge.hubspot.com/integrations/how-do-i-get-my-hubspot-api-key) and to choose between Snowflake and BigQuery as the way to deliver data to Thoughtspot Embrace or Thoughtspot Cloud. Have your database credentials with write privileges ready for the setup wizard.

Don’t have your own data warehouse? No worries, follow [these instructions](https://docs.google.com/document/d/1_7DRa7KdeXT1ZZ22ENDxW4fDO1BL_n8uTqhiSQms2pE/edit?usp=sharing).

The resulting flow will contain the HubSpot data Source component that connects to your instance, set of transformations to create the data model, and a database writer to populate the data warehouse of your choice. 

All that is left then is to set up the connection in Thoughtspot and, if you haven’t done so yet, install the [Hubspot Analytics TML](https://developers.thoughtspot.com/codespot/jira-tmp-finish) from CodeSpot.

The use case will run daily at 2am, however you can change the schedule in the Flows menu.

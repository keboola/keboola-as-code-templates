Upon selecting this template, you will be asked for your [HubSpot token](https://knowledge.hubspot.com/integrations/how-do-i-get-my-hubspot-api-key) and to choose between Snowflake and BigQuery as the way to deliver data to ThoughtSpot Embrace or ThoughtSpot Cloud. Have your database credentials with write privileges ready for the setup wizard.

Don’t have your own data warehouse? No worries, follow [these instructions](https://docs.google.com/document/d/1_7DRa7KdeXT1ZZ22ENDxW4fDO1BL_n8uTqhiSQms2pE).

The resulting flow will contain the HubSpot data source component that connects to your instance, a set of transformations to create the data model, and a database writer to populate the data warehouse of your choice. 

All that is left then is to set up the connection in ThoughtSpot and, if you haven’t done so yet, install the [Hubspot Marketing Analytics TML block from CodeSpot](https://developers.thoughtspot.com/codespot/jira-tmp-finish).

The use case will run daily at 2am, however you can change the schedule in the Flows menu.

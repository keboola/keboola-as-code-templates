After selecting this template, you will be asked to authorize the data source component to access data in your Google Analytics profile.

You can then choose between Snowflake and BigQuery as the way to deliver data to Thoughtspot Embrace or Thoughtspot Cloud. Have your database credentials with write privileges ready for the setup wizard.

Don’t have your own data warehouse? No worries, follow [these instructions](https://docs.google.com/document/d/1_7DRa7KdeXT1ZZ22ENDxW4fDO1BL_n8uTqhiSQms2pE/edit?usp=sharing) to get one provided by Keboola.

The resulting flow will contain the Google Analytics data Source component that connects to your instance, set of transformations to create the data model, and a database writer to populate the data warehouse of your choice. 

All that is left then is to set up the connection in Thoughtspot and, if you haven’t done so yet, install the Google Analytics Spotapp or [TML block](https://developers.thoughtspot.com/codespot/google-analytics-tml-blocks).
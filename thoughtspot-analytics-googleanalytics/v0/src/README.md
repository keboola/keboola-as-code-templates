# Google Analytics to ThoughtSpot

With this end-to-end flow you can extract data from Google Analytics and bring it into Keboola Connection. After all the necessary tasks are performed on the data, you can transform the results into visualizations in ThoughtSpot’s SpotApps.

The process is simple. We will guide you through it, and, when needed, ask you to set up your profile and authorize the source and destination components.

## The flow, in a nutshell

First, the Google Analytics source component will collect data from your Google Analytics account.

Then we will put your data into the requested shape, and you will select a destination component that will load the results either into a Snowflake database or into a Google BigQuery dataset.

Finally, you will schedule and run the entire flow (i.e., the sequence of all the prepared, above mentioned steps, in the correct order). The source component, all data manipulations, and the Snowflake or Google BigQuery destination components (if selected), will be processed.

At this point, your data will be prepared to be loaded into SpotApps as a reporting source. Once you are in SpotApps, enter the credentials of the database where you store your newly created data, and you can start using your reporting right away.



# Shopify to Snowflake and SpotApps

With this end-to-end flow you can extract your updated data from Shopify and bring it into Keboola Connection. After all the necessary tasks are performed on the data, you can transform the results into visualizations in ThoughtSpot’s SpotApps.

The process is simple. We will guide you through it, and, when needed, ask you to provide your credentials and authorize the destination component.

## The flow, in a nutshell
First, the Shopify source component will collect data from your Shopify account (data about orders, products, inventory, and customers). You can also bring in marketing data from your Facebook Ads, Google Ads, and/or Sklik accounts.

We then create the output tables. We add NULL values if any columns are missing, check the data, and perform a stand-alone analysis and then an RFM analysis. 

The Snowflake destination component will then load your data into a Snowflake database.

Finally, you will schedule and run the entire flow (i.e., the sequence of all the prepared, above mentioned steps, in the correct order). The Shopify source component, all data manipulations and analyses, and the Snowflake destination component, will be processed.

At this point, your data will be prepared to be loaded into SpotApps as a reporting source. Once you are in SpotApps, enter the credentials of the Snowflake database where you store your newly created data, and you can start using your reporting right away.




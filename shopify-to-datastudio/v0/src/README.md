## Shopify to Data Studio
With this end-to-end flow you can extract your updated data from Shopify and bring it into Keboola Connection. After all the necessary tasks are performed on the data, you can transform the results into visualizations in a prepared Google Data Studio Dashboard template.
 
The process is simple. We will guide you through it, and, when needed, ask you to provide your credentials and authorize the data destination.

### The flow, in a nutshell 

First, the Shopify source component will collect data from your Shopify account (data about orders, products, inventory, and customers). You can also bring in marketing data from your Facebook Ads, Google Ads, and/or Sklik accounts.

We then create the output tables. We add NULL values if any columns are missing. We also check the data, and perform an RFM analysis. 

The data is then written into a Google Sheets account via the Google Sheets destination component. It is then mapped to data in Data Studio so that the dashboard provided by Keboola works.

Finally, you will run the entire flow (i.e., the sequence of all the prepared, above mentioned steps, in the correct order). The Shopify source component, all data manipulations and analyses, and the Google Sheets destination component, will be processed.

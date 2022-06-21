## Shopify to Data Studio
Using this end-to-end flow you can extract your updated data from Shopify and bring it into Keboola Connection. After you are done performing all your desired tasks with the data, you will be able to transform the results into visualizations in a prepared Google Data Studio Dashboard template.

The whole process is very simple. We will guide you through it, and, if necessary, ask you to fill out your credentials, authorize the data destination, and finally, run the entire flow.
The flow in a nutshell: 
First, the Shopify data source component will collect data from your Shopify account (data about orders, products, inventory, and customers). You can also bring in marketing data from your Facebook Ads, Google Ads, and/or Sklik accounts.
After that we prepare and create the output tables. We add NULL values in case some columns are missing. We also check the data, and perform an RFM analysis. 
The data will be then written into a Google Sheets account via the Google Sheets data destination component. Then it will be mapped to data in Data Studio so the dashboard provided by Keboola works.
Finally, you will run the entire flow, i.e. the sequence of all the prepared, above mentioned, steps in the appropriate order. The Shopify data source component, all data manipulations and analyses, and the Google Sheets data destination component will be processed.
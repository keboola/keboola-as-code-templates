The process is simple. We will guide you through it, and, when needed, ask you to provide your credentials and authorize the destination component.

The flow, in a nutshell:

- First, we import Shopify demo data (data about orders, products, inventory, and customers). 

- We then create the output tables. We add NULL values if any columns are missing. We also check the data and perform an RFM analysis.

- The data is then written into a Snowflake database via the Snowflake data destination component.

- In the last step we deploy the DataApp to visualize and play with the results

- Finally, you will run the entire flow (i.e., the sequence of all the prepared, above-mentioned steps, in the correct order). The Shopify component, all data manipulations and analyses, the Snowflake destination component, and the Interactive Data App will be executed.

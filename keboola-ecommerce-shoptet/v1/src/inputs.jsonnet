{
  stepsGroups: [
    {
      description: "Configure your credentials for Shoptet extractor.",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-shoptet",
          name: "Shoptet",
          description: "Shoptet - Data Source",
          dialogName: "Shoptet Data Source", 
          dialogDescription: "Extractor collects data from Shoptet about orders, products, inventory, and customers.",
          inputs: [
            {
              id: "ex-shoptet-permalink-shop-name",
              name: "Shop Name",
              description: "Insert name of your shop.",
              type: "string",
              kind: "input",
            },
            {
              id: "ex-shoptet-permalink-base-url",
              name: "Base URL",
              description: "Your shop url. e.g. https://www.myshop.cz",
              type: "string",
              kind: "input",
            },
            {
              id: "ex-shoptet-permalink-orders-url",
              name: "Orders URL",
              description: "e.g. https://www.myshop.cz/export/orders.csv?hash=XXXXX",
              type: "string",
              kind: "input",
            },
            {
              id: "ex-shoptet-permalink-products-url",
              name: "Products URL",
              description: "e.g. https://www.myshop.cz/export/products.csv?hash=XXXXX",
              type: "string",
              kind: "input",
            },
            {
              id: "ex-shoptet-permalink-customers-url",
              name: "Customers URL",
              description: "e.g. https://www.myshop.cz/export/customers.csv?hash=XXXXX",
              type: "string",
              kind: "input",
            },
            {
              id: "ex-shoptet-permalink-stock-url",
              name: "Stock URL",
              description: "e.g. https://www.myshop.cz/export/stockStatistics.csv?hash=X",
              type: "string",
              kind: "input",
            },
            {
              id: "ex-shoptet-permalink-src-charset",
              name: "File charset",
              description: "Source file charset. All files will be converted to UTF-8.",
              type: "string",
              kind: "input",
              default: "windows-1250"
            },
            {
              id: "ex-shoptet-permalink-delimiter",
              name: "Source file delimiter",
              description: "Insert source file delimiter.",
              type: "string",
              kind: "input",
              default: ";"
            },
            {
              id: "ex-shoptet-permalink-from-date",
              name: "Period from date [incl.]",
              description: "Select period from which you want to get the data.",
              type: "string",
              kind: "select",
              default: "2 months ago",
              options: [
                {
                  value: '1 week ago',
                  label: '1 week ago',
                },
                {
                  value: '2 weeks ago',
                  label: '2 weeks ago',
                },
                {
                  value: '1 month ago',
                  label: '1 month ago',
                },
                {
                  value: '2 months ago',
                  label: '2 months ago',
                },
              ],
            },
            {
              id: "ex-shoptet-permalink-to-date",
              name: "Period to date [exclud.]",
              description: "Select period to date you want to get the data.",
              type: "string",
              kind: "select",
              default: "now",
              options: [
                {
                  value: 'now',
                  label: 'now',
                },
                {
                  value: '1 day ago',
                  label: '1 day ago',
                },
                {
                  value: '1 week ago',
                  label: '1 week ago',
                },
              ],
            }
          ]
        }
      ]
    },
    {
      description: "Configure your credentials for Snowflake writer.",
      required: "optional",
      steps: [
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake Destination",
          description: "Load to data into snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Data load to Snowflake DB.",
          inputs: [
            {
              id: "wr-snowflake-blob-storage-db-host",
              name: "Hostname",
              description: "Insert database hostname.",
              type: "string",
              kind: "input",
              rules: "required",
              default: "keboola.west-europe.azure.snowflakecomputing.com",
            },
            {
              id: "wr-snowflake-blob-storage-db-port",
              name: "Port",
              description: "Insert database port number.",
              type: "string",
              kind: "input",
              default: "443",
              showif: "[wr-snowflake-blob-storage-db-host] != ''",
            },
            {
              id: "wr-snowflake-blob-storage-db-user",
              name: "Username",
              description: "Insert database username.",
              type: "string",
              kind: "input",
              default: "KEBOOLA_WORKSPACE_13631041",
              showif: "[wr-snowflake-blob-storage-db-host] != ''",
            },
            {
              id: "wr-snowflake-blob-storage-db-password",
              name: "Password",
              description: "Insert your password to the database.",
              type: "string",
              kind: "hidden",
              showif: "[wr-snowflake-blob-storage-db-host] != ''",
            },
            {
              id: "wr-snowflake-blob-storage-db-database",
              name: "Database Name",
              description: "Insert name of your database.",
              type: "string",
              kind: "input",
              default: "KEBOOLA_6518",
              showif: "[wr-snowflake-blob-storage-db-host] != ''",
            },
            {
              id: "wr-snowflake-blob-storage-db-schema",
              name: "Schema",
              description: "Insert database schema.",
              type: "string",
              kind: "input",
              default: "WORKSPACE_13631041",
              showif: "[wr-snowflake-blob-storage-db-host] != ''",
            },
            {
              id: "wr-snowflake-blob-storage-db-warehouse",
              name: "Warehouse",
              description: "Insert database warehouse.",
              type: "string",
              kind: "input",
              default: "KEBOOLA_PROD",
              showif: "[wr-snowflake-blob-storage-db-host] != ''",
            },
          ]
        },
        {
          icon: "component:keboola.wr-google-sheet",
          name: "Google sheet Destination",
          description: "Load to data into google sheet",
          dialogName: "Google Sheet Destination", 
          dialogDescription: "Data load to Google Sheet.",
          inputs: [
            {
              id: "google-sheet-checkbox",
              name: "Google sheet destination",
              description: "Do you want to load data into google sheet?",
              type: "bool",
              kind: "confirm",
              rules: "required",
            },
          ],  
        },
      ]
    },
  ],
}
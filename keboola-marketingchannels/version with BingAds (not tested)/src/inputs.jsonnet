{
  stepsGroups: [
    {
      description: "Configure your credentials for marketing channels.",
      required: "atLeastOne",
      steps: [
        {
          icon: "component:esnerda.ex-bingads",
          name: "BingAds",
          description: "BingAds - Data Source",
          dialogName: "BingAds Data Source", 
          dialogDescription: "This extractor is getting data about campaigns, it is incremental upload.",
          inputs: [
            {
              id: "ex-bingads-dev-key",
              name: "Developer Token",
              description: "Your developer token",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "ex-bingads-account-id",
              name: "Account ID",
              description: "Account identifier (if empty, all accounts are downloaded)",
              type: "string",
              kind: "input",
              default: "180687194",
            },
            {
              id: "ex-bingads-customer-id",
              name: "Customer ID",
              description: "Customer identifier of your BingAds account.",
              type: "string",
              kind: "input",
              default: "XXXXXXXX",
            },
          ]
        },
        {
          icon: "component:keboola.ex-facebook-ads",
          name: "Facebook Ads Data Source",
          description: "Facebook Ads - Data Source",
          dialogName: "Facebook Ads Data Source", 
          dialogDescription: "This extractor is getting data about facebook campaigns, ads, adsets and ads insights for the last day.",
          inputs: [
            {
              id: "ex-facebook-ads-api-version",
              name: "Api version",
              description: "Set Facebook Api version",
              type: "string",
              kind: "input",
              default: "v12.0",
              rules: "required",
            },
          ]
        },
        {
          icon: "component:leochan.ex-linkedin",
          name: "LinkedIn Ads",
          description: "LinkedIn Ads - Data Source",
          dialogName: "LinkedIn Ads Data Source", 
          dialogDescription: "This extractor is incremental. It is necessary to input start time range and end time range of the analytics.",
          inputs: [
            {
              id: "ex-linkedin-start-day",
              name: "Start Day",
              description: "Start time range of the analytics",
              type: "int",
              kind: "input",
              rules: "min=1,max=31,required",
              default: 1,
            },
            {
              id: "ex-linkedin-start-month",
              name: "Start Month",
              description: "Start time range of the analytics",
              type: "int",
              kind: "input",
              rules: "min=1,max=12",
              default: 1,
            },
            {
              id: "ex-linkedin-start-year",
              name: "Start Year",
              description: "Start time range of the analytics",
              type: "int",
              kind: "input",
              rules: "min=2000,max=2100",
              default: 2022,
            },
            {
              id: "ex-linkedin-end-day",
              name: "End Day",
              description: "End time range of the analytics",
              type: "int",
              kind: "input",
              rules: "min=1,max=31",
              default: 1,
            },
            {
              id: "ex-linkedin-end-month",
              name: "End Month",
              description: "End time range of the analytics",
              type: "int",
              kind: "input",
              rules: "min=1,max=12",
              default: 1,
            },
            {
              id: "ex-linkedin-end-year",
              name: "End Year",
              description: "End time range of the analytics",
              type: "int",
              kind: "input",
              rules: "min=2000,max=2100",
              default: 2022,
            },
          ]
        },
        {
          icon: "component:keboola.ex-google-ads",
          name: "Google Ads",
          description: "Google Ads - Data Source",
          dialogName: "Google Ads Data Source", 
          dialogDescription: "This extractor is getting data from Google Ads about campaigns for the last day.",
          inputs: [
            {
              id: "ex-google-ads-customer-id",
              name: "Ads Customer Id",
              description: "Insert ads customer ID",
              type: "string",
              kind: "input",
              default: "XXX-XXX-XXXX",
              rules: "required",
            },
          ]
        }
      ]
    },
    {
      description: "Google Analytics",
      required: "zeroOrOne",
      steps: [
        {
          icon: "component:keboola.ex-google-analytics-v4",
          name: "Google Analytics",
          description: "Google Analytics - Data Source",
          dialogName: "Analytics Data Source", 
          dialogDescription: "This extractor is getting data from Google Analytics. It's an incremental update. This data will enrich the marketing model with keywords adgroup and marketing transactions. ",
          inputs: [
            {
              id: "ga-from",
              name: "Period from date",
              description: "From when do you want to get the data?",
              type: "string",
              kind: "select",
              rules: "required",
              default: "-1 month",
              options: [
                {
                  value: '-1 week',
                  label: '1 week ago',
                },
                {
                  value: '-2 weeks',
                  label: '2 weeks ago',
                },
                {
                  value: '-1 month',
                  label: '1 month ago',
                },
                {
                  value: '-2 months',
                  label: '2 months ago',
                },
              ],
            },
            {
              id: "ga-to",
              name: "Period to date",
              description: "To when do you want to get the data?",
              type: "string",
              kind: "select",
              default: "-1 day",
              options: [
                {
                  value: '-1 day',
                  label: '1 day ago',
                },
                {
                  value: '-1 week',
                  label: '1 week ago',
                },
              ],
            },
          ]
        }
      ]
    },
    {
      description: "Snowflake transformations",
      required: "all",
      steps: [
        {
          icon: "component:keboola.snowflake-transformation",
          name: "Snowflake SQL",
          description: "Transformations",
          inputs: [],
        },
      ]
    },
    {
      description: "Data Destination",
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
              description: "Insert database hostname",
              type: "string",
              kind: "input",
              rules: "required",
              default: "keboola.west-europe.azure.snowflakecomputing.com"
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
              default: "KEBOOLA_WORKSPACE_12781571",
              showif: "[wr-snowflake-blob-storage-db-host] != ''",
            },
            {
              id: "wr-snowflake-blob-storage-db-password",
              name: "Database Password",
              description: "Insert your password to the database.",
              showif: "[wr-snowflake-blob-storage-db-host] != ''",
              type: "string",
              kind: "hidden",
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
              default: "WORKSPACE_12781571",
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
          dialogDescription: "Make a copy of this sheet https://docs.google.com/spreadsheets/d/1KkIjJqU7wrOdfy3zJA8RSEDCtFoE5Szg9aUInL7XCB0 into your Drive. Then copy text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: [
            {
              id: "google-sheet-id",
              name: "Marketing Sheet ID",
              description: "Insert ID of the google sheet destination",
              type: "string",
              kind: "input",
            },
          ]
        },
        {
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google Big Query",
          description: "Big Query - Destination",
          dialogName: "Big Query Destination", 
          dialogDescription: "Data load to Google Big Query",
          inputs: [
            {
              id: "wr-google-bigquery-v2-service-account-private-key",
              name: "Private key",
              description: "Add your service account private key.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "wr-google-bigquery-v2-service-account-client-email",
              name: "Client email",
              description: "Add your service account client email.",
              type: "string",
              kind: "input",
              default: "templates@keboola-shopify.iam.gserviceaccount.com",
            },
            {
              id: "wr-google-bigquery-v2-service-account-client-id",
              name: "Client ID",
              description: "Add your service account client id.",
              type: "string",
              kind: "input",
              default: "Client ID",
            },
            {
              id: "wr-google-bigquery-v2-service-account-private-key-id",
              name: "Private Key ID",
              description: "Add your service account private key ID.",
              type: "string",
              kind: "input",
              default: "Private key id",
            },
            {
              id: "wr-google-bigquery-v2-service-account-project-id",
              name: "Project ID",
              description: "Add your service account project ID.",
              type: "string",
              kind: "input",
              default: "Project id",
            },
          ]
        }
      ]
    }
  ]
}  

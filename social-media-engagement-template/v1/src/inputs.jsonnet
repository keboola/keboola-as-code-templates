{
  stepsGroups: [
    {
      description: "Provide credentials for the source components.",
      required: "atLeastOne" ,
      steps: [
        {
          icon: "component:keboola.ex-facebook",
          name: "Facebook Pages",
          description: "Import data from Facebook Pages",
          dialogName: "Facebook Pages Source", 
          dialogDescription: "This source component imports posts engagement and page engagement from your Facebook Pages.",
          inputs: [
            {
              id:          "oauth-facebookads",
              name:        "Open Authentication",
              description: "Authorize Facebook Pages",
              type:        "object",
              kind:        "oauth",
              componentId: "keboola.ex-facebook",
              rules:       "required",
            },
            {
              id:           "oauth-facebookads-accounts",
              name:         "Facebook Pages Accounts",
              description:  "Accounts for Facebook Pages",
              type:         "object",
              kind:         "oauthAccounts",
              oauthInputId: "oauth-facebookads",
              rules:        "required",
            },
            {
              id: "ex-facebook-ads-since",
              name: "Period from date [incl.]",
              description: "Select the period from which you want to get the data",
              type: "string",
              kind: "select",
              default: 'last_30d',
              options: [
                {
                  value: 'last_30d',
                  label: 'last 30 days',
                },
                {
                  value: 'last_60d',
                  label: 'last 60 days',
                },
                {
                  value: 'last_93d',
                  label: 'last 93 days',
                },
              ],
            }
          ]
        },
        {
          icon: "component:kds-team.ex-linkedin-pages",
          name: "LinkedIn Pages",
          description: "Import data from LinkedIn Pages",
          dialogName: "LinkedIn Pages Source", 
          dialogDescription: "This source component imports posts engagement and page engagement from your LinkedIn Page.",
          inputs: [
            {
              id:          "oauth-linkedinads",
              name:        "Open Authentication",
              description: "Authorization for LinkedIn Ads",
              type:        "object",
              kind:        "oauth",
              componentId: "kds-team.ex-linkedin-pages",
              rules:       "required",
            },
            {
              id: "ex-linkedin-pages-sync-options-date-from",
              name: "Sync options Date from",
              type: "string",
              kind: "select",
              default: "1 month ago",
              options: [
                {
                  value: '1 month ago',
                  label: '1 month ago',
                },
                {
                  value: '2 months ago',
                  label: '2 months ago',
                },
                {
                  value: '3 months ago',
                  label: '3 months ago',
                },
                {
                  value: '12 months ago',
                  label: '12 months ago',
                },
              ],
            },
            
          ]
        }, 
        {
          icon: "component:keboola.ex-instagram",
          name: "Instagram",
          description: "Import data from Instagram",
          dialogName: "Instagram Source", 
          dialogDescription: "This component imports post engagement and page engagement from your Instagram Business Accounts. Authorization is via a Facebook account and Facebook page connected to an Instagram business account.",
          inputs: [
            {
              id:          "oauth-instagram",
              name:        "Open Authentication",
              description: "Authorization for Instagram Pages",
              type:        "object",
              kind:        "oauth",
              componentId: "keboola.ex-instagram",
              rules:       "required",
            },
            {
              id:           "oauth-instagram-accounts",
              name:         "Instagram Accounts",
              description:  "Accounts for Instagram",
              type:         "object",
              kind:         "oauthAccounts",
              oauthInputId: "oauth-instagram",
              rules:        "required",
            },
            {
              id: "ex-instagram-since",
              name: "Period from date [incl.]",
              description: "Select the period from which you want to extract the data",
              type: "string",
              kind: "select",
              default: '30 days ago',
              options: [
                {
                  value: '7 days ago',
                  label: '7 days ago',
                },
                {
                  value: '14 days ago',
                  label: '14 days ago',
                },
                {
                  value: '30 days ago',
                  label: '30 days ago',
                },
              ],
            }
          ]
        },
        {
          icon: "component:keboola.ex-youtube",
          name: "YouTube Channel",
          description: "Import data from your YouTube channel",
          dialogName: "YouTube Channel Source", 
          dialogDescription: "This source component imports all posts (videos) engagement from your YouTube channel.",
          inputs: [
            {
              id:          "oauth-youtube",
              name:        "Open Authentication",
              description: "Authorize YouTube",
              type:        "object",
              kind:        "oauth",
              componentId: "keboola.ex-youtube",
              rules:       "required",
            }
          ]
        },         
      ],
    },{   
      description: "Transformations",
      required: "all",
      steps: [
        {
          icon: "component:keboola.snowflake-transformation",
          name: "Snowflake SQL",
          description: "SQL Transformations",
          inputs: [],
        },
      ]
    },

    {
      description: "Provide credentials for the destination component",
      required: "optional",
      steps: [
        {
          icon: "component:keboola.wr-db-pgsql",
          name: "PostgreSQL Destination",
          description: "Load data into PostgreSQL",
          dialogName: "PostgreSQL Destination", 
          dialogDescription: "This destination component loads data into a PostgreSQL database.",
          inputs: [
            {
              id: "wr-db-pgsql-db-host",
              name: "Host",
              description: "Insert the host address",
              type: "string",
              kind: "input",
              default: "host.example.rds.amazonaws.com",
            },
            {
              id: "wr-db-pgsql-db-database",
              name: "Database",
              description: "Insert the name of the database",
              type: "string",
              kind: "input",
              default: "database name",
            },
            {
              id: "wr-db-pgsql-db-port",
              name: "Port",
              description: "Insert the database port",
              type: "string",
              kind: "input",
              default: "5432",
            },
            {
              id: "wr-db-pgsql-db-schema",
              name: "Schema",
              description: "Insert the schema name",
              type: "string",
              kind: "input",
              default: "public",
            },
            {
              id: "wr-db-pgsql-db-user",
              name: "User",
              description: "Insert the user name",
              type: "string",
              kind: "input",
              default: "user name",
            },
            {
              id: "wr-db-pgsql-db-password",
              name: "Password",
              description: "Insert the password",
              type: "string",
              kind: "hidden",
            }
          ]
        },
        {
          icon: "component:keboola.wr-db-mysql",
          name: "My SQL Destination",
          description: "Load data into MySQL",
          dialogName: "My SQL Destination", 
          dialogDescription: "Data load to My SQL DB.",
          inputs: [
            {
              id: "wr-db-mysql-db-host",
              name: "Host",
              description: "Insert the host",
              type: "string",
              kind: "input",
              default: "host.example.rds.amazonaws.com",
            },
            {
              id: "wr-db-mysql-db-database",
              name: "Database",
              description: "Insert the name of the database",
              type: "string",
              kind: "input",
              default: "database name",
            },
            {
              id: "wr-db-mysql-db-port",
              name: "Port",
              description: "Insert the database port",
              type: "string",
              kind: "input",
              default: "3306",
            },
            {
              id: "wr-db-mysql-db-user",
              name: "User",
              description: "Insert the user name",
              type: "string",
              kind: "input",
              default: "user name",
            },
            {
              id: "wr-db-mysql-db-password",
              name: "Password",
              description: "Insert your password",
              type: "string",
              kind: "hidden",
            }
          ]
        },
        {
          icon: "component:<keboola.wr-snowflake>",
          name: "Snowflake",
          description: "Load data into Snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "This destination component loads data into a Snowflake database.",
          inputs: [
            {
              id: "wr-snowflake-db-host",
              name: "Hostname",
              description: "Insert the database hostname",
              type: "string",
              kind: "input",
              rules: "required",
              default: "hostname.com",
            },
            {
              id: "wr-snowflake-db-port",
              name: "Port",
              description: "Insert the database port number",
              type: "string",
              kind: "input",
              default: "443",
              showif: "[wr-snowflake-db-host] != ''",
            },
            {
              id: "wr-snowflake-db-user",
              name: "Username",
              description: "Insert the database username",
              type: "string",
              kind: "input",
              default: "userName",
              showif: "[wr-snowflake-db-host] != ''",
            },
            {
              id: "wr-snowflake-db-password",
              name: "Database Password",
              description: "Insert your password to the database",
              showif: "[wr-snowflake-db-host] != ''",
              type: "string",
              kind: "hidden",
            },
            {
              id: "wr-snowflake-db-database",
              name: "Database Name",
              description: "Insert the name of the database",
              type: "string",
              kind: "input",
              default: "DatabaseName",
              showif: "[wr-snowflake-db-host] != ''",
            },
            {
              id: "wr-snowflake-db-schema",
              name: "Schema",
              description: "Insert the database schema",
              type: "string",
              kind: "input",
              default: "Schema",
              showif: "[wr-snowflake-db-host] != ''",
            },
            {
              id: "wr-snowflake-db-warehouse",
              name: "Warehouse",
              description: "Insert the database warehouse",
              type: "string",
              kind: "input",
              default: "Warehouse",
              showif: "[wr-snowflake-db-host] != ''",
            },
          ]
        },
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Google Sheets",
          description: "Load data into Google Sheets",
          dialogName: "Google Sheets Destination", 
          dialogDescription: "Copy [this sheet](https://docs.google.com/spreadsheets/d/1BFXwTno70hJIZJWQ_iHW26qZvjCIQmxLAg1W93gQTrM/edit?usp=sharing) into your drive. Copy the text between 'spreadsheets/d/' and '/edit' and paste it below.",
          inputs: [
            {
              id:          "oauth-googlesheet",
              name:        "Open Authentication",
              description: "Authorization for Google Sheets",
              type:        "object",
              kind:        "oauth",
              componentId: "keboola.wr-google-sheets",
              rules:       "required",
            },
            {
                id: "google-sheet-id",
                name: "gSheet File ID",
                description: "Insert the file ID of the Google sheet destination",
                type: "string",
                kind: "input",
                rules: "required",
                default: "XXXXXXX"
            }
          ],  
        },
        {
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google BigQuery",
          description: "Load data into BigQuery",
          dialogName: "BigQuery Destination", 
          dialogDescription: "This destination component loads data into a Google BigQuery database.",
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
                default: "ID",
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
        },
      ]
    }
  ],
}

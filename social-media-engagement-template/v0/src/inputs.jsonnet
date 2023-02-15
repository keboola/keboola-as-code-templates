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
          dialogDescription: "This source component imports posts engagement and page engagement from your Facebook Pages",
          inputs: [
            {
              id:          "oauth-facebookads",
              name:        "Open Authentication",
              description: "Authorization for Facebook Pages",
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
              description: "Select period from which you want to get the data.",
              type: "string",
              kind: "select",
              default: 'last_90d',
              options: [
                {
                  value: 'last_month',
                  label: '1 month ago',
                },
                {
                  value: 'last_60d',
                  label: '2 months ago',
                },
                {
                  value: 'last_90d',
                  label: '3 months ago',
                },
                {
                  value: 'last_year',
                  label: '12 months ago',
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
          dialogDescription: "This source component imports posts engagement and page engagement from your LinkedIn Page",
          inputs: [
            {
              id:          "oauth-linkedinads",
              name:        "Open Authentication",
              description: "Authorization for LinkedIn Ads",
              type:        "object",
              kind:        "oauth",
              componentId: "leochan.ex-linkedin",
              rules:       "required",
            },
            {
              id: "ex-linkedin-pages-sync-options-date-from",
              name: "Sync options Date from",
              description: "linkedin",
              type: "string",
              kind: "select",
              default: "3 months ago",
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
          dialogDescription: "This source component imports posts engagement and page engagement from your Instagram account",
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
              description: "Select period from which you want to get the data.",
              type: "string",
              kind: "select",
              default: 'last_90d',
              options: [
                {
                  value: 'last_month',
                  label: '1 month ago',
                },
                {
                  value: 'last_60d',
                  label: '2 months ago',
                },
                {
                  value: 'last_90d',
                  label: '3 months ago',
                },
                {
                  value: 'last_year',
                  label: '12 months ago',
                },
              ],
            }
          ]
        },
        {
          icon: "component:keboola.ex-twitter",
          name: "Twitter Page",
          description: "Import data from Twitter Page",
          dialogName: "Twitter Pages Source", 
          dialogDescription: "This source component imports all posts engagement and page engagement (since this day) from your Twitter account",
          inputs: [
            {
              id:          "oauth-twitter",
              name:        "Open Authentication",
              description: "Authorization for Twitter",
              type:        "object",
              kind:        "oauth",
              componentId: "keboola.ex-twitter",
              rules:       "required",
            },
            {
              id: "followersList_screen_name",
              name: "Screen Name",
              description: "Enter your screen name for followers list",
              type: "string",
              kind: "input",
              default: 'Followers List Screen Name',
            },
            {
              id: "userTimeline_screen_name",
              name: "Screen Name",
              description: "Enter your screen name for user timeline",
              type: "string",
              kind: "input",
              default: 'User Timeline Screen Name',
            }
          ]
        },
        {
          icon: "component:keboola.ex-youtube",
          name: "Youtube Channel",
          description: "Import data from Youtube Channel",
          dialogName: "Youtube Channel Source", 
          dialogDescription: "This source component imports all posts (videos) engagement from your Youtube Channel",
          inputs: [
            {
              id:          "oauth-youtube",
              name:        "Open Authentication",
              description: "Authorization for Youtube",
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
      description: "Configure your credentials for writer.",
      required: "optional",
      steps: [
        {
          icon: "component:keboola.wr-db-pgsql",
          name: "PostgreSQL Destination",
          description: "Load data into PostgreSQL",
          dialogName: "PostgreSQL Destination", 
          dialogDescription: "Data load to PostgreSQL DB.",
          inputs: [
            {
              id: "wr-db-pgsql-db-host",
              name: "Host",
              description: "Insert Host address.",
              type: "string",
              kind: "input",
              default: "host.example.rds.amazonaws.com",
            },
            {
              id: "wr-db-pgsql-db-database",
              name: "Database",
              description: "Insert Database Name.",
              type: "string",
              kind: "input",
              default: "Database name",
            },
            {
              id: "wr-db-pgsql-db-port",
              name: "Port",
              description: "Insert DB Port.",
              type: "string",
              kind: "input",
              default: "5432",
            },
            {
              id: "wr-db-pgsql-db-schema",
              name: "Schema",
              description: "Insert Schema name.",
              type: "string",
              kind: "input",
              default: "public",
            },
            {
              id: "wr-db-pgsql-db-user",
              name: "User",
              description: "Insert User Name.",
              type: "string",
              kind: "input",
              default: "user name",
            },
            {
              id: "wr-db-pgsql-db-password",
              name: "Password",
              description: "Insert Password.",
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
              description: "Insert host.",
              type: "string",
              kind: "input",
              default: "host.example.rds.amazonaws.com",
            },
            {
              id: "wr-db-mysql-db-database",
              name: "Database",
              description: "Insert Database name.",
              type: "string",
              kind: "input",
              default: "database name",
            },
            {
              id: "wr-db-mysql-db-port",
              name: "Port",
              description: "Insert DB port.",
              type: "string",
              kind: "input",
              default: "3306",
            },
            {
              id: "wr-db-mysql-db-user",
              name: "User",
              description: "Insert user name.",
              type: "string",
              kind: "input",
              default: "user name",
            },
            {
              id: "wr-db-mysql-db-password",
              name: "Password",
              description: "Insert Password.",
              type: "string",
              kind: "hidden",
            }
          ]
        },
        {
          icon: "component:"+SnowflakeWriterComponentId(),
          name: "Snowflake Destination",
          description: "Load data into Snowflake",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Data load to Snowflake DB.",
          inputs: [
            {
              id: "wr-snowflake-db-host",
              name: "Hostname",
              description: "Insert database hostname",
              type: "string",
              kind: "input",
              rules: "required",
              default: "hostname.com",
            },
            {
              id: "wr-snowflake-db-port",
              name: "Port",
              description: "Insert database port number.",
              type: "string",
              kind: "input",
              default: "443",
              showif: "[wr-snowflake-db-host] != ''",
            },
            {
              id: "wr-snowflake-db-user",
              name: "Username",
              description: "Insert database username.",
              type: "string",
              kind: "input",
              default: "userName",
              showif: "[wr-snowflake-db-host] != ''",
            },
            {
              id: "wr-snowflake-db-password",
              name: "Database Password",
              description: "Insert your password to the database.",
              showif: "[wr-snowflake-db-host] != ''",
              type: "string",
              kind: "hidden",
            },
            {
              id: "wr-snowflake-db-database",
              name: "Database Name",
              description: "Insert name of your database.",
              type: "string",
              kind: "input",
              default: "DatabaseName",
              showif: "[wr-snowflake-db-host] != ''",
            },
            {
              id: "wr-snowflake-db-schema",
              name: "Schema",
              description: "Insert database schema.",
              type: "string",
              kind: "input",
              default: "Schema",
              showif: "[wr-snowflake-db-host] != ''",
            },
            {
              id: "wr-snowflake-db-warehouse",
              name: "Warehouse",
              description: "Insert database warehouse.",
              type: "string",
              kind: "input",
              default: "Warehouse",
              showif: "[wr-snowflake-db-host] != ''",
            },
          ]
        },
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Google sheet Destination",
          description: "Load to data into google sheet",
          dialogName: "Google Sheet Destination", 
          dialogDescription: "Make a copy of [this sheet](https://docs.google.com/spreadsheets/d/1BFXwTno70hJIZJWQ_iHW26qZvjCIQmxLAg1W93gQTrM/edit?usp=sharing) into your Drive. Copy text between 'spreadsheets/d/' and '/edit' and paste it below.",
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
                name: "CRM gSheet File ID",
                description: "Insert file ID of the google sheet destination",
                type: "string",
                kind: "input",
                rules: "required",
                default: "XXXXXXX"
            }
          ],  
        },
      ]
    }
  ],
}

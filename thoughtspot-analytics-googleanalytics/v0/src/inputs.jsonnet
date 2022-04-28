{
  stepsGroups: [
    {
      description: "Configure your credentials for Google Analytics extractor.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-google-analytics-v4",
          name: "Google Analytics",
          description: "Google Analytics Data Source",
          dialogName: "Analytics Data Source", 
          dialogDescription: "This extractor is getting data from Google Analytics. It's an incremental update.",
          inputs: [],  
        },
      ],
    },
    {   
      description: "Snowflake Transformation",
      required: "all",
      steps: [
        {
          icon: "component:keboola.snowflake-transformation",
          name: "Snowflake SQL",
          description: "Transformation",
          inputs: [],
        },
      ]
    },
    {
      description: "Configure your credentials for writer.",
      required: "optional",
      steps: [
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake",
          description: "Snowflake - Destination",
          dialogName: "Snowflake Destination", 
          dialogDescription: "Data load to Snowflake database.",
          inputs: [
            {
              id: "wr-snowflake-blob-storage-db-host",
              name: "Hostname",
              description: "Insert database hostname.",
              type: "string",
              kind: "input",
              rules: "required",
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
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google Big Query",
          description: "Big Query - Destination",
          dialogName: "Big Query Destination", 
          dialogDescription: "Data load to Google Big Query",
          inputs: [
            {
              id: "wr-google-bigquery-v2-service-account-private-key",
              name: "Private key",
              description: "Service account Private key",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "wr-google-bigquery-v2-service-account-client-id",
              name: "Client id",
              description: "Service account Client id",
              type: "string",
              kind: "input",
              showif: "[wr-google-bigquery-v2-service-account-private-key] != ''",
            },
            {
              id: "wr-google-bigquery-v2-service-account-private-key-id",
              name: "Private key id",
              description: "Service account Private key id",
              type: "string",
              kind: "input",
              showif: "[wr-google-bigquery-v2-service-account-private-key] != ''",
            },
            {
              id: "wr-google-bigquery-v2-service-account-project-id",
              name: "Project id",
              description: "Service account Project id",
              type: "string",
              kind: "input",
              showif: "[wr-google-bigquery-v2-service-account-private-key] != ''",
            },
          ],
        }
      ]
    }
  ]
}
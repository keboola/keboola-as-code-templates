{
  stepsGroups: [
    {
      description: "Extractor",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-http",
          name: "Demo Data",
          description: "Demo Data for dbt",
          dialogName: "", 
          dialogDescription: "",
          inputs: []
        }
      ]
    },
    {   
      description: "dbt Transformation",
      required: "all",
      steps: [
        {
          icon: "component:keboola.dbt-transformation",
          name: "dbt",
          description: "dbt Transformation",
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
          icon: "component:keboola.wr-db-mssql-v2",
          name: "MS SQL Destination",
          description: "Load data into MS SQL",
          dialogName: "MS SQL Destination", 
          dialogDescription: "Data load to MS SQL DB.",
          inputs: [
            {
              id: "wr-db-mssql-v2-db-host",
              name: "Host",
              description: "Insert DB Host.",
              type: "string",
              kind: "input",
              default: "mssql.your.database.rds.amazonaws.com",
            },
            {
              id: "wr-db-mssql-v2-db-database",
              name: "Database",
              description: "Insert Database name.",
              type: "string",
              kind: "input",
              default: "database-name",
            },
            {
              id: "wr-db-mssql-v2-db-port",
              name: "Port",
              description: "Insert port.",
              type: "string",
              kind: "input",
              default: "1433",
            },
            {
              id: "wr-db-mssql-v2-db-user",
              name: "User",
              description: "Insert User Name.",
              type: "string",
              kind: "input",
              default: "User name",
            },
            {
              id: "wr-db-mssql-v2-db-password",
              name: "Password",
              description: "Insert database password.",
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
          icon: "component:keboola.wr-google-bigquery-v2",
          name: "Google Big Query",
          description: "Load data into Big Query.",
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
  ]
}
{
  stepsGroups: [
    {
      description: "Source component",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-shopify",
          name: "Shopify Demo Data",
          description: "Imports demo data from Shopify",
          dialogName: "Shopify Demo Data", 
          dialogDescription: "This source component imports demo Shopify data (orders, products, inventory, etc.).",
          inputs: [],
        }
      ]
    },
    {   
      description: "Snowflake Transformations",
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
      description: "Provide credentials for the destination component.",
      required: "all",
      steps: [
        {
          icon: "component:"+SnowflakeWriterComponentId(),
          name: "Snowflake Destination",
          description: "Save data into Snowflake",
          dialogName: "Snowflake Destination",
          dialogDescription: "Fill your database credentials.",
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
      ]
    },
    {   
      description: "Interactive Data App",
      required: "all",
      steps: [
        {
          icon: "component:keboola.data-apps",
          name: "Interactive Data App",
          description: "Web App visualizing the results of RFM Analysis",
          inputs: [],
        },
      ]
    }
  ]
}

{
  stepsGroups: [
    {
      description: "Configure your credentials for hubspot extractor.",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-hubspot-crm",
          name: "Hubspot",
          description: "Hubspot - Data Source",
          dialogName: "Authorize Hubspot Data Source", 
          dialogDescription: "This extractor is getting data from HubSpot. It's an incremental update and the extractor is taking data about: companies, activities, lists, owners, contacts, deals and pipelines.",
          inputs: [
            {
              id: "ex-hubspot-crm-api-token",
              name: "API token",
              description: "Insert your API Token.",
              type: "string",
              kind: "hidden",
            },
            {
              id: "ex-hubspot-crm-period-from",
              name: "Period from date [incl.]",
              description: "Fill from when do you want to download the data.",
              type: "string",
              kind: "input",
              default: "1 month ago",
            },
          ]
        }
      ]
    },
    {
      description: "Writer",
      required: "optional",
      steps: [
          {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Snowflake Data Destination",
          description: "Load to data into snowflake",
          dialogName: "Authorize Snowflake Data Destination", 
          dialogDescription: "Data load to Snowflake DB.",
          inputs: [
            {
              id: "wr-snowflake-blob-storage-db-host",
              name: "Hostname",
              description: "Insert database hostname",
              type: "string",
              kind: "input",
              rules: "required",
              default: "keboola.west-europe.azure.snowflakecomputing.com",
              //showif: "[select-writer] == 'snowflake-db'",
            },
            {
              id: "wr-snowflake-blob-storage-db-port",
              name: "Port",
              description: "Insert database port number.",
              type: "string",
              kind: "input",
              default: "443",
              //showif: "[select-writer] == 'snowflake-db'",
            },
            {
              id: "wr-snowflake-blob-storage-db-user",
              name: "Username",
              description: "Insert database username.",
              type: "string",
              kind: "input",
              default: "KEBOOLA_WORKSPACE_12781571",
              //showif: "[select-writer] == 'snowflake-db'",
            },
            {
              id: "wr-snowflake-blob-storage-db-password",
              name: "Database Password",
              description: "Insert your password to the database.",
              type: "string",
              kind: "hidden",
              //showif: "[select-writer] == 'snowflake-db'",
            },
            {
              id: "wr-snowflake-blob-storage-db-database",
              name: "Database Name",
              description: "Insert name of your database.",
              type: "string",
              kind: "input",
              default: "KEBOOLA_6518",
              //showif: "[select-writer] == 'snowflake-db'",
            },
            {
              id: "wr-snowflake-blob-storage-db-schema",
              name: "Schema",
              description: "Insert database schema.",
              type: "string",
              kind: "input",
              default: "WORKSPACE_12781571",
              //showif: "[select-writer] == 'snowflake-db'",
            },
            {
              id: "wr-snowflake-blob-storage-db-warehouse",
              name: "Warehouse",
              description: "Insert database warehouse.",
              type: "string",
              kind: "input",
              default: "KEBOOLA_PROD",
              //showif: "[select-writer] == 'snowflake-db'",
            },
          ]
        },
        {
          icon: "component:keboola.wr-google-sheet",
          name: "Google sheet Data Destination",
          description: "Load to data into google sheet",
          dialogName: "Google Sheet Data Destination", 
          dialogDescription: "Data load to Google Sheet.",
          inputs: [
            {
              id: "google-sheet-checkbox",
              name: "Use google sheet as data destination",
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
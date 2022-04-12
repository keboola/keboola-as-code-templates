{
  inputs: [
    {
      id: "wr-snowflake-blob-storage-db-host",
      name: "Hostname",
      description: "Insert database hostname.",
      type: "string",
      kind: "input",
    },
    {
      id: "wr-snowflake-blob-storage-db-port",
      name: "Port",
      description: "Insert database port number.",
      type: "string",
      kind: "input",
      default: "443",
    },
    {
      id: "wr-snowflake-blob-storage-db-port",
      name: "Username",
      description: "Insert database username.",
      type: "string",
      kind: "input",
    },
    {
      id: "wr-snowflake-blob-storage-db-password",
      name: "Password",
      description: "Insert your password into database.",
      type: "string",
      kind: "hidden",
    },
    {
      id: "wr-snowflake-blob-storage-database",
      name: "Database Name",
      description: "Insert your database name.",
      type: "string",
      kind: "input",
    },
    {
      id: "wr-snowflake-blob-storage-db-schema",
      name: "Schema",
      description: "Insert database schema.",
      type: "string",
      kind: "input",
    },
    {
      id: "wr-snowflake-blob-storage-db-warehouse",
      name: "Warehouse",
      description: "Insert database warehouse.",
      type: "string",
      kind: "input",
    },
  ],
}


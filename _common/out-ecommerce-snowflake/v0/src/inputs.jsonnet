[
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
    rules: "required",
    showif: "[wr-snowflake-blob-storage-db-host] != ''",
  },
  {
    id: "wr-snowflake-blob-storage-db-user",
    name: "Username",
    description: "Insert database username.",
    type: "string",
    kind: "input",
    default: "KEBOOLA_WORKSPACE_12781571",
    rules: "required",
    showif: "[wr-snowflake-blob-storage-db-host] != ''",
  },
  {
    id: "wr-snowflake-blob-storage-db-password",
    name: "Database Password",
    description: "Insert your password to the database.",
    showif: "[wr-snowflake-blob-storage-db-host] != ''",
    type: "string",
    rules: "required",
    kind: "hidden",
  },
  {
    id: "wr-snowflake-blob-storage-db-database",
    name: "Database Name",
    description: "Insert name of your database.",
    type: "string",
    kind: "input",
    default: "KEBOOLA_6518",
    rules: "required",
    showif: "[wr-snowflake-blob-storage-db-host] != ''",
  },
  {
    id: "wr-snowflake-blob-storage-db-schema",
    name: "Schema",
    description: "Insert database schema.",
    type: "string",
    kind: "input",
    default: "WORKSPACE_12781571",
    rules: "required",
    showif: "[wr-snowflake-blob-storage-db-host] != ''",
  },
  {
    id: "wr-snowflake-blob-storage-db-warehouse",
    name: "Warehouse",
    description: "Insert database warehouse.",
    type: "string",
    kind: "input",
    default: "KEBOOLA_PROD",
    rules: "required",
    showif: "[wr-snowflake-blob-storage-db-host] != ''",
  },
]
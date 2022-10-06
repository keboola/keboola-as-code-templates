{
  parameters: {
    db: {
      port: if InputIsAvailable("wr-snowflake-db-port") == true then Input("wr-snowflake-db-port") else "",
      schema: if InputIsAvailable("wr-snowflake-db-schema") == true then Input("wr-snowflake-db-schema") else "",
      warehouse: if InputIsAvailable("wr-snowflake-db-warehouse") == true then Input("wr-snowflake-db-warehouse") else "",
      driver: "snowflake",
      host: if InputIsAvailable("wr-snowflake-db-host") == true then Input("wr-snowflake-db-host") else "",
      user: if InputIsAvailable("wr-snowflake-db-user") == true then Input("wr-snowflake-db-user") else "", 
      database: if InputIsAvailable("wr-snowflake-db-database") == true then Input("wr-snowflake-db-database") else "", 
      "#password": if InputIsAvailable("wr-snowflake-db-password") == true then Input("wr-snowflake-db-password") else "", 
    },
  },
}

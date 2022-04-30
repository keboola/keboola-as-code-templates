{
  isIgnored: if InputIsAvailable("wr-snowflake-blob-storage-db-host") == false && InputIsAvailable("ex-sklik-token") == false && InputIsAvailable("ex-google-ads-customer-id") == false && InputIsAvailable("ex-facebook-ads-api-version") == false then 
              true,
}
{
  isIgnored: if InputIsAvailable("ex-sklik-token")|| InputIsAvailable("ex-google-ads-customer-id")||InputIsAvailable("ex-facebook-ads-api-version") then
                InputIsAvailable("wr-snowflake-blob-storage-db-host") == false,
}
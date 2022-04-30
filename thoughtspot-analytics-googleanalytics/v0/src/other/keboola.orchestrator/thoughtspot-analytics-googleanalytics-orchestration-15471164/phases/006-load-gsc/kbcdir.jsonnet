{
  isIgnored: if InputIsAvailable("wr-snowflake-blob-storage-db-host") == false then
              true
            else if InputIsAvailable("wr-snowflake-blob-storage-db-host") == true && InputIsAvailable("gsc_ranking") == false then 
              true
            else false,
}
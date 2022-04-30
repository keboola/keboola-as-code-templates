{
  isIgnored: if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") == false then
              true
            else if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") == true && InputIsAvailable("gsc_ranking") == false then 
              true
            else false,
}
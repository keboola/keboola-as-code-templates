{
  isIgnored: InputIsAvailable("oauth-facebookads") == false && HasProjectBackend("bigquery") == false && InputIsAvailable("oauth-instagram") == false && InputIsAvailable("wr-db-pgsql-db-host") == false && InputIsAvailable("oauth-linkedinads") == false,
}
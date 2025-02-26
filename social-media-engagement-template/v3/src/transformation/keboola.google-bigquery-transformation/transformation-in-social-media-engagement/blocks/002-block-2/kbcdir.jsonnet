{
  isIgnored: (InputIsAvailable("oauth-facebookads") == false && InputIsAvailable("oauth-instagram") == false && InputIsAvailable("wr-db-pgsql-db-host") == false && InputIsAvailable("oauth-linkedinads") == false) || HasProjectBackend("bigquery") == false,
}
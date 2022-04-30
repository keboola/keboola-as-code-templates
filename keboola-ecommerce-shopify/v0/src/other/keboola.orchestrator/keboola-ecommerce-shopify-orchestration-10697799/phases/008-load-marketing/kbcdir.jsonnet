{
  isIgnored: if InputIsAvailable("ex-sklik-token") == false && InputIsAvailable("ex-google-ads-customer-id") == false && InputIsAvailable("ex-facebook-ads-api-version") == false then 
              Input("google-sheet-checkbox") == false,
}
{
  isIgnored: if Input("google-sheet-checkbox") == false then
                if InputIsAvailable("ex-sklik-token") == false && InputIsAvailable("ex-google-ads-customer-id") == false && InputIsAvailable("ex-facebook-ads-api-version") == false then true else false,
}
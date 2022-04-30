{
  isIgnored: if Input("google-sheet-checkbox") == false then
                InputIsAvailable("ex-sklik-token") == false && InputIsAvailable("ex-google-ads-customer-id") == false && InputIsAvailable("ex-facebook-ads-api-version") == false,
}
{
  isIgnored: if Input("google-sheet-checkbox") == false then
              true
            else if Input("google-sheet-checkbox") == true && InputIsAvailable("ex-sklik-token") == false && InputIsAvailable("ex-google-ads-customer-id") == false && InputIsAvailable("ex-facebook-ads-api-version") == false then
              true
            else false,
}
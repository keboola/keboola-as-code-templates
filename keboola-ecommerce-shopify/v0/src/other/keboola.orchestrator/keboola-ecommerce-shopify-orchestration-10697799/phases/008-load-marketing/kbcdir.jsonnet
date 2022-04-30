{
  isIgnored: if InputIsAvailable("ex-sklik-token")|| InputIsAvailable("ex-google-ads-customer-id")||InputIsAvailable("ex-facebook-ads-api-version") then
                Input("google-sheet-checkbox") == false,
}
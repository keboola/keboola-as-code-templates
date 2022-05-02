{
  name: "Load",
  dependsOn: std.filter(function(v) v != null,[
    "003-transformation-part2",
    if InputIsAvailable("ex-facebook-ads-api-version") then"002-transformation-facebook",
    if InputIsAvailable("ex-google-ads-customer-id") then "002-transformation-google-ads",
    if InputIsAvailable("ex-sklik-token") then "002-transformation-sklik",
    ]),
}

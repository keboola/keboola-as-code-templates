{
  name: "Load",
  dependsOn: std.filter(function(v) v != null,[
    "002-transformation",
    if InputIsAvailable("gsc-domain") then "002-transformation-gsc",
    ]),
}

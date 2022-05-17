{ 
configurations: std.filter(function(v) v != null,[
    if InputIsAvailable("ex-google-ads-customer-id") then
    {
        componentId: "keboola.ex-google-ads",
        id: ConfigId("keboola-marketingchannels-googleads-data-source"),
        path: "extractor/keboola.ex-google-ads/keboola-marketingchannels-googleads-data-source",
        rows: [
        {
            id: ConfigRowId("ad-groups"),
            path: "rows/ad-groups",
        },
        {
            id: ConfigRowId("url-adwords"),
            path: "rows/url-adwords",
        },
        ],
    },
    if InputIsAvailable("ex-google-ads-customer-id") then
    {
        componentId: "keboola.snowflake-transformation",
        id: ConfigId("keboola-marketingchannels-googleads-transformation"),
        path: "transformation/keboola.snowflake-transformation/keboola-marketingchannels-googleads-transformation",
        rows: [],
        metadata: { "KBC.configuration.folderName": "[KEBOOLA-MARKETINGCHANNELS]"}
    },
  ]),
}

{
  parameters: {
    name: "campaign",
    query: "SELECT campaign.name, metrics.clicks, metrics.impressions, metrics.cost_micros, segments.date FROM campaign",
    since: Input("ex-google-ads-since"),
    until: Input("ex-google-ads-until"),
    primary: [],
  },
}

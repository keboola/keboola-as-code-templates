{
  parameters: {
    query: "SELECT ad_group.id, ad_group.name, campaign.id, campaign.name, metrics.impressions, metrics.clicks, metrics.cost_micros, segments.date FROM ad_group",
    since: Input("ex-google-ads-since"),
    until: Input("ex-google-ads-until"),
    name: "ad_groups",
    primary: [
      "adGroupId",
      "segmentsDate",
    ],
  },
}

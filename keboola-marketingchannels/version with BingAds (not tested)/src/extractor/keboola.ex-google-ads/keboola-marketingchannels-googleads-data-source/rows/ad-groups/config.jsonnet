{
  parameters: {
    query: "SELECT ad_group.id, ad_group.name, campaign.id, campaign.name, metrics.impressions, metrics.clicks, metrics.cost_micros, segments.date FROM ad_group",
    since: "2022-01-01",
    until: "-1 day",
    name: "ad_groups",
    primary: [
      "adGroupId",
      "segmentsDate",
    ],
  },
}

{
  parameters: {
    name: "campaign",
    query: "SELECT campaign.name, metrics.clicks, metrics.impressions, metrics.cost_micros, segments.date FROM campaign",
    since: "-30 days",
    until: "now",
    primary: [
      "segmentsDate",
      "campaignName",
    ],
  },
}

{
  parameters: {
    query: "SELECT campaign.id, campaign.name, campaign.status, metrics.cost_micros, metrics.clicks, metrics.impressions, metrics.average_cpm, metrics.ctr, metrics.average_cpc, metrics.cost_micros, metrics.active_view_cpm, metrics.active_view_ctr, metrics.active_view_impressions, metrics.average_cost, metrics.average_cpc, metrics.average_cpe, metrics.average_cpm, metrics.average_cpv, metrics.cost_micros, campaign.frequency_caps, campaign.target_cpm.target_frequency_goal.target_count FROM campaign",
    since: Input("ex-google-ads-since"),
    until: Input("ex-google-ads-until"),
    name: "campaign",
    primary: [],
  },
}

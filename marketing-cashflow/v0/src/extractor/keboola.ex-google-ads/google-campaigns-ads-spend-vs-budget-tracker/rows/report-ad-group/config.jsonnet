{
  parameters: {
    query: " SELECT   ad_group.id,  ad_group.name,   metrics.cost_micros,  metrics.clicks,   metrics.impressions,  metrics.average_cpm,   metrics.ctr,   metrics.average_cpc,  metrics.cost_micros,   metrics.active_view_cpm,   metrics.active_view_ctr,   metrics.active_view_impressions,   metrics.average_cost,  metrics.average_cpc,  metrics.average_cpe,  metrics.average_cpm,   metrics.average_cpv,  metrics.cost_micros  FROM ad_group",
    since: Input("ex-google-ads-since"),
    until: Input("ex-google-ads-until"),
    name: "ad_group",
    primary: [],
  },
}

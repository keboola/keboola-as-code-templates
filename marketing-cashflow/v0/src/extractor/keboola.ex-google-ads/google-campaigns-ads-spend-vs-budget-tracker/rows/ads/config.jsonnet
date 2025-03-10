{
  parameters: {
    query: "SELECT ad_group_ad.ad.id, ad_group_ad.ad.name, campaign.end_date, campaign.start_date, segments.date, ad_group_ad.ad_group, ad_group.id, ad_group.name, campaign.campaign_budget, campaign.id, campaign.name, metrics.average_cost, metrics.cost_micros, metrics.average_cpc, metrics.impressions, campaign.frequency_caps, metrics.average_cpm,metrics.active_view_cpm, metrics.average_cpv, metrics.clicks, metrics.ctr, metrics.video_views, metrics.video_view_rate, customer.currency_code FROM ad_group_ad",
    since: Input("ex-google-ads-since"),
    until: Input("ex-google-ads-until"),
    name: "ad",
    primary: [],
  },
}

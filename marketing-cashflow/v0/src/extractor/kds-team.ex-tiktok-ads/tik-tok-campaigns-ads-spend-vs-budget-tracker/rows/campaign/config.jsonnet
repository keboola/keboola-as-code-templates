{
  parameters: {
    destination: {
      incremental: false,
      output_table_name: "TIKTOK_CAMPAIGN",
    },
    advertiser_id: [],
    report_settings: {
      date_to: Input("ex-tiktok-to-date"),
      filters: [],
      metrics: "campaign_name, objective_type, campaign_budget, spend, impressions, reach, cpm, clicks, ctr, frequency, comments, likes, shares, video_play_actions, video_watched_6s, video_views_p100",
      date_from: Input("ex-tiktok-date-from"),
      data_level: "AUCTION_CAMPAIGN",
      dimensions: "campaign_id",
      report_type: "BASIC",
      service_type: "AUCTION",
    },
  },
}

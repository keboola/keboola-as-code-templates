{
  parameters: {
    destination: {
      incremental: false,
      output_table_name: "TIKTOK_AD",
    },
    advertiser_id: [],
    report_settings: {
      date_to: Input("ex-tiktok-to-date"),
      filters: [],
      metrics: "ad_name, campaign_id, adgroup_id,  objective_type, campaign_budget, placement_type, promotion_type, budget, currency, spend, impressions, reach, cpm, clicks, ctr, frequency, comments, likes, shares, video_play_actions, video_watched_6s, video_views_p100",
      date_from: Input("ex-tiktok-date-from"),
      data_level: "AUCTION_AD",
      dimensions: "ad_id, stat_time_day",
      report_type: "BASIC",
      service_type: "AUCTION",
    },
  },
}

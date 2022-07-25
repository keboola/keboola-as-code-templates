{
  parameters: {
    query: "SELECT ad_group.id, campaign.id, segments.date, landing_page_view.unexpanded_final_url FROM  landing_page_view",
    since: Input("ex-google-ads-since"),
    until: Input("ex-google-ads-until"),
    name: "url_adwords",
    primary: [
      "adGroupId",
      "segmentsDate",
    ],
  },
}

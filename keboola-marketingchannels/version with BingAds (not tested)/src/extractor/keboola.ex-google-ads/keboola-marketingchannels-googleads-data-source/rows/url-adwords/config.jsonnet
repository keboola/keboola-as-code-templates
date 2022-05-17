{
  parameters: {
    query: "SELECT ad_group.id, campaign.id, segments.date, landing_page_view.unexpanded_final_url FROM  landing_page_view",
    since: "2022-01-01",
    until: "-1 day",
    name: "url_adwords",
    primary: [
      "adGroupId",
      "segmentsDate",
    ],
  },
}

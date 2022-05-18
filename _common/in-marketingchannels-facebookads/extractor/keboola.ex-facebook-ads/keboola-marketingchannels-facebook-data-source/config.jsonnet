{
  authorization: {
    oauth_api: {},
  },
  parameters: {
    "api-version": Input("ex-facebook-ads-api-version"),
    queries: [
      {
        id: 70382,
        type: "nested-query",
        name: "campaigns",
        query: {
          path: "campaigns",
          fields: "id,name,account_id",
          ids: "",
          limit: "100",
          since: "2022-01-01",
          until: "1 day ago",
        },
      },
      {
        id: 81542,
        type: "nested-query",
        name: "ads",
        query: {
          path: "ads",
          fields: "id,name,adset_id,targeting{geo_locations{countries}}",
          ids: "",
          limit: "100",
          since: "2022-01-01",
          until: "1 day ago",
        },
      },
      {
        id: 77690,
        type: "nested-query",
        name: "adsets",
        query: {
          path: "adsets",
          fields: "id,name,campaign_id",
          ids: "",
          limit: "100",
          since: "2022-01-01",
          until: "1 day ago",
        },
      },
      {
        id: 43920,
        type: "nested-query",
        name: "ads_insights",
        query: {
          path: "ads",
          fields: "insights.action_breakdowns(action_type).date_preset(last_7d).time_increment(1){ad_id,impressions,reach,inline_link_clicks,spend},adcreatives{id,object_story_spec{page_id,link_data{link}},url_tags}",
          ids: "",
          limit: "100",
          since: "2022-01-01",
          until: "1 day ago",
        },
      },
    ],
  },
}

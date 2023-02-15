{
  authorization: {
    oauth_api: Input("oauth-instagram")
  },
  parameters: Input("oauth-instagram-accounts") + {
  queries: [
      {
        id: 13831,
        type: "nested-query",
        name: "media",
        query: {
          path: "media",
          fields: "id,caption,media_type,like_count,ig_id,comments_count,is_comment_enabled,media_url,owner,permalink,shortcode,timestamp,thumbnail_url,comments,from_id,from_full_name,impressions,reach,engagement,saved",
          limit: "25",
          ids: "",
        },
      },
      {
        id: 32736,
        type: "nested-query",
        name: "media_lifetime_insights",
        query: {
          path: "media",
          fields: "insights.metric(impressions,reach,engagement,saved)",
          limit: "25",
          ids: "",
        },
      },
      {
        id: 6580,
        type: "nested-query",
        name: "page_daily_insights",
        query: {
          path: "",
          fields: "insights.date_preset("+Input("ex-instagram-since")+").metric(reach,impressions,follower_count,email_contacts,text_message_clicks,get_directions_clicks,phone_call_clicks,website_clicks,profile_views)",
          limit: "25",
          ids: "",
        },
      },
    ],
  },
}

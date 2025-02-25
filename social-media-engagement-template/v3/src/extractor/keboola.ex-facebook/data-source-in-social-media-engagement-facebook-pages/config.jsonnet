{
  authorization: {
    oauth_api: Input("oauth-facebookads"),
  },
  parameters: Input("oauth-facebookads-accounts") + {
    queries: [
      {
        id: 13510,
        type: "nested-query",
        name: "feed",
        query: {
          path: "feed",
          fields: "message,created_time,shares,actions,status_type,from,call_to_action,post_impressions,post_impressions_unique, engagement, post_negative_feedback, post_engaged_users, post_consumptions, post_impressions_fan, post_impressions_paid,  page_posts_impressions_organic, page_posts_impressions_paid, page_posts_impressions",
          limit: "100",
          ids: "",
        },
        disabled: false,
      },
      {
        id: 28030,
        type: "nested-query",
        name: "feed_likes",
        query: {
          path: "feed",
          fields: "reactions.date_preset("+Input("ex-facebook-ads-since")+").type(LIKE).summary(total_count).limit(0)",
          limit: "100",
          ids: "",
        },
      },
      {
        id: 86221,
        type: "nested-query",
        name: "page_insights",
        query: {
          path: "",
          fields: "insights.date_preset("+Input("ex-facebook-ads-since")+").metric(page_views_total, page_fan_removes, page_fan_adds, page_fans, page_negative_feedback, page_consumptions, page_engaged_users, page_impressions)",
          limit: "100",
          ids: "",
          since: "",
          until: "",
        },
      },
    ],
  },
}

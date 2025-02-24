{
  parameters: {},
  storage: {
    input: {
      tables: std.filter(function(v) v != null,[
        if InputIsAvailable("oauth-facebookads") then
        {
          source: "in.c-keboola-ex-facebook-" + ConfigId("data-source-in-social-media-engagement-facebook-pages") + ".page_insights",
          destination: "facebook_page_insights",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        if InputIsAvailable("oauth-facebookads") then
        {
          source: "in.c-keboola-ex-facebook-" + ConfigId("data-source-in-social-media-engagement-facebook-pages") + ".feed",
          destination: "facebook_feed",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        if InputIsAvailable("oauth-facebookads") then
        {
          source: "in.c-keboola-ex-facebook-" + ConfigId("data-source-in-social-media-engagement-facebook-pages") + ".feed_likes_summary",
          destination: "facebook_feed_likes_summary",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        if InputIsAvailable("oauth-instagram") then
        {
          source: "in.c-keboola-ex-instagram-" + ConfigId("data-source-in-social-media-engagement-instagram") + ".media",
          destination: "instagram_media",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        if InputIsAvailable("oauth-instagram") then
        {
          source: "in.c-keboola-ex-instagram-" + ConfigId("data-source-in-social-media-engagement-instagram") + ".media_lifetime_insights",
          destination: "instagram_media_lifetime_insights",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        if InputIsAvailable("oauth-instagram") then
        {
          source: "in.c-keboola-ex-instagram-" + ConfigId("data-source-in-social-media-engagement-instagram") + ".page_daily_insights",
          destination: "instagram_page_daily_insights",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        if InputIsAvailable("oauth-linkedinads") then
        {
          source: "in.c-kds-team-ex-linkedin-pages-" + ConfigId("data-source-in-social-media-engagement-linkedin-pages") + ".time_bound_share_statistics",
          destination: "linkedin_time_bound_share_statistics",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        if InputIsAvailable("oauth-linkedinads") then
        {
          source: "in.c-kds-team-ex-linkedin-pages-" + ConfigId("data-source-in-social-media-engagement-linkedin-pages") + ".time_bound_page_statistics",
          destination: "linkedin_time_bound_page_statistics",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        if InputIsAvailable("oauth-linkedinads") then
        {
          source: "in.c-kds-team-ex-linkedin-pages-" + ConfigId("data-source-in-social-media-engagement-linkedin-pages") + ".posts",
          destination: "linkedin_posts",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        if InputIsAvailable("oauth-linkedinads") then
        {
          source: "in.c-kds-team-ex-linkedin-pages-" + ConfigId("data-source-in-social-media-engagement-linkedin-pages") + ".likes",
          destination: "linkedin_likes",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        if InputIsAvailable("oauth-youtube") then
        {
          source: "in.c-keboola-ex-youtube-" + ConfigId("data-source-in-social-media-engagement-youtube") + ".videosDetail",
          destination: "youtube_videosDetail",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],)
    },
    output: {
      tables: [
        {
          destination: "out.c-social-media-engagement-" + InstanceIdShort() + ".pages_engagement",
          source: "pages_engagement",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "date",
            "source",
          ],
        },
        {
          destination: "out.c-social-media-engagement-" + InstanceIdShort() + ".posts_engagement",
          source: "posts_engagement",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "uid",
          ],
        },
      ],
    },
  },
}

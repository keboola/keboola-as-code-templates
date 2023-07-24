{
  authorization: {
    oauth_api: Input("oauth-googlesheet"),
  },
  parameters: {
    tables: std.filter(function(v) v != null,[
      if InputIsAvailable("oauth-facebookads") || InputIsAvailable("oauth-linkedinads") || InputIsAvailable("oauth-instagram") || InputIsAvailable("oauth-twitter") then
      {
        id: 69562,
        action: "update",
        sheetTitle: "PagesEngagement",
        enabled: true,
        tableId: "out.c-social-media-engagement-" + InstanceIdShort() + ".pages_engagement",
        title: "PagesAndPostsEngagement",
        fileId: Input("google-sheet-id"),
        sheetId: 0, 
      },
      {
        id: 37237,
        action: "update",
        sheetTitle: "PostsEngagement",
        enabled: true,
        tableId: "out.c-social-media-engagement-" + InstanceIdShort() + ".posts_engagement",
        title: "PagesAndPostsEngagement",
        fileId: Input("google-sheet-id"),
        sheetId: 795055650, 
      },
    ]),
  },
  storage: {
    input: {
      tables: std.filter(function(v) v != null,[
        if InputIsAvailable("oauth-facebookads") || InputIsAvailable("oauth-linkedinads") || InputIsAvailable("oauth-instagram") || InputIsAvailable("oauth-twitter") then
        {
          source: "out.c-social-media-engagement-" + InstanceIdShort() + ".pages_engagement",
          destination: "out.c-social-media-engagement-" + InstanceIdShort() + ".pages_engagement.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-social-media-engagement-" + InstanceIdShort() + ".posts_engagement",
          destination: "out.c-social-media-engagement-" + InstanceIdShort() + ".posts_engagement.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ]),
    },
  },
}

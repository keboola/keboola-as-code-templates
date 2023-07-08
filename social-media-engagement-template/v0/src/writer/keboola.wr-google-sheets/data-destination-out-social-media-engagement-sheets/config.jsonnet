{
  authorization: {
    oauth_api: Input("oauth-googlesheet"),
  },
  parameters: {
    tables: [
      {
        id: 69562,
        action: "update",
        sheetTitle: "PagesEngagement",
        enabled: true,
        tableId: "out.c-social-media-engagement" + InstanceIdShort() + ".pages_engagement",
        title: "PagesAndPostsEngagement",
        fileId: Input("google-sheet-id"),
        sheetId: 0, // musí se doplnit dle vzorového google sheetu
      },
      {
        id: 37237,
        action: "update",
        sheetTitle: "PostsEngagement",
        enabled: true,
        tableId: "out.c-social-media-engagement" + InstanceIdShort() + ".posts_engagement",
        title: "PagesAndPostsEngagement",
        fileId: Input("google-sheet-id"),
        sheetId: 795055650, // musí se doplnit dle vzorového google sheetu
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-social-media-engagement" + InstanceIdShort() + ".pages_engagement",
          destination: "out.c-social-media-engagement" + InstanceIdShort() + ".pages_engagement.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-social-media-engagement" + InstanceIdShort() + ".posts_engagement",
          destination: "out.c-social-media-engagement" + InstanceIdShort() + ".posts_engagement.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
  },
}

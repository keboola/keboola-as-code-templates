{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-facebook-" + ConfigId("data-source-in-social-media-engagement-facebook-pages") + ".page_insights",
          destination: "page_insights",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-facebook-" + ConfigId("data-source-in-social-media-engagement-facebook-pages") + ".feed",
          destination: "feed",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-facebook-" + ConfigId("data-source-in-social-media-engagement-facebook-pages") + ".feed_likes_summary",
          destination: "feed_likes_summary",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-social-media-engagement" + InstanceIdShort() + ".posts_engagement",
          primary_key: [
            "uid",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          source: "posts_engagement",
        },
        {
          destination: "out.c-social-media-engagement" + InstanceIdShort() + ".pages_engagement",
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
      ],
    },
  },
}

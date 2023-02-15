{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-linkedin-pages-" + ConfigId("data-source-in-social-media-engagement-linkedin-pages") + ".time_bound_share_statistics",
          destination: "time_bound_share_statistics",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-linkedin-pages-" + ConfigId("data-source-in-social-media-engagement-linkedin-pages") + ".time_bound_page_statistics",
          destination: "time_bound_page_statistics",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-linkedin-pages-" + ConfigId("data-source-in-social-media-engagement-linkedin-pages") + ".posts",
          destination: "posts",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-linkedin-pages-" + ConfigId("data-source-in-social-media-engagement-linkedin-pages") + ".likes",
          destination: "likes",
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
          destination: "out.c-social-media-engagement" + InstanceIdShort() + ".pages_engagement",
          primary_key: [
            "date",
            "source",
          ],
          source: "pages_engagement",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-social-media-engagement" + InstanceIdShort() + ".posts_engagement",
          source: "posts_engagement",
          primary_key: [
            "uid",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
      ],
    },
  },
}

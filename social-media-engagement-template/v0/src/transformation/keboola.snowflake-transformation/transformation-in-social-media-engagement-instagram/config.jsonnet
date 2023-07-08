{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-instagram-" + ConfigId("data-source-in-social-media-engagement-instagram") + ".media",
          destination: "media",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-instagram-" + ConfigId("data-source-in-social-media-engagement-instagram") + ".media_lifetime_insights",
          destination: "media_lifetime_insights",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-instagram-" + ConfigId("data-source-in-social-media-engagement-instagram") + ".page_daily_insights",
          destination: "page_daily_insights",
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
          source: "posts_engagement",
          primary_key: [
            "uid",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
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
      ],
    },
  },
}

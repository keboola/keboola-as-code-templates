{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-twitter-" + ConfigId("data-source-in-social-media-engagement-twitter") + ".users",
          destination: "users",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-twitter-" + ConfigId("data-source-in-social-media-engagement-twitter") + ".tweets",
          destination: "tweets",
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
          source: "pages_engagement",
          primary_key: [
            "date",
            "source",
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

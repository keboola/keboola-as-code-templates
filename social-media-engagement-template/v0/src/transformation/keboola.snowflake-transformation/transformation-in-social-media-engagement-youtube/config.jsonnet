{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-youtube-" + ConfigId("data-source-in-social-media-engagement-youtube") + ".videosDetail",
          destination: "videosDetail",
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
      ],
    },
  },
}

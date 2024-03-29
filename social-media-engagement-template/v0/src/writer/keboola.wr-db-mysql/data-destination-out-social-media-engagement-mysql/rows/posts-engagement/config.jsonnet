{
  parameters: {
    tableId: "out.c-social-media-engagement-" + InstanceIdShort() + ".posts_engagement",
    dbName: "posts_engagement",
    incremental: false,
    primaryKey: [
      "uid",
    ],
    items: [
      {
        name: "uid",
        dbName: "uid",
        type: "VARCHAR",
        nullable: false,
        default: "",
        size: "128",
      },
      {
        name: "post_id",
        dbName: "post_id",
        type: "VARCHAR",
        nullable: true,
        default: "",
        size: "256",
      },
      {
        name: "source",
        dbName: "source",
        type: "VARCHAR",
        nullable: true,
        default: "",
        size: "16",
      },
      {
        name: "date",
        dbName: "date",
        type: "DATE",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "post_text",
        dbName: "post_text",
        type: "VARCHAR",
        nullable: true,
        default: "",
        size: "65535",
      },
      {
        name: "shares",
        dbName: "shares",
        type: "INT",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "views",
        dbName: "views",
        type: "INT",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "likes",
        dbName: "likes",
        type: "INT",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "comments",
        dbName: "comments",
        type: "INT",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "all_reactions",
        dbName: "all_reactions",
        type: "INT",
        nullable: true,
        default: "",
        size: "",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-social-media-engagement-" + InstanceIdShort() + ".posts_engagement",
          destination: "out.c-social-media-engagement-" + InstanceIdShort() + ".posts_engagement.csv",
          columns: [
            "uid",
            "post_id",
            "source",
            "date",
            "post_text",
            "shares",
            "views",
            "likes",
            "comments",
            "all_reactions",
          ],
        },
      ],
    },
  },
}

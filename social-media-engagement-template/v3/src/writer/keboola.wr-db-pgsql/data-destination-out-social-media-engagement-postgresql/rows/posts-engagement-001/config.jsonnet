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
        type: "varchar",
        nullable: false,
        default: "",
        size: "256",
      },
      {
        name: "post_id",
        dbName: "post_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "256",
      },
      {
        name: "source",
        dbName: "source",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16",
      },
      {
        name: "date",
        dbName: "date",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "post_text",
        dbName: "post_text",
        type: "varchar",
        nullable: true,
        default: "",
        size: "10485760",
      },
      {
        name: "shares",
        dbName: "shares",
        type: "int",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "views",
        dbName: "views",
        type: "int",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "likes",
        dbName: "likes",
        type: "int",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "comments",
        dbName: "comments",
        type: "int",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "all_reactions",
        dbName: "all_reactions",
        type: "int",
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

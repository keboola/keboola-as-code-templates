{
  parameters: {
    tableId: "out.c-social-media-engagement" + InstanceIdShort() + ".pages_engagement",
    dbName: "pages_engagement",
    incremental: false,
    primaryKey: [
      "date",
      "source",
    ],
    items: [
      {
        name: "source",
        dbName: "source",
        type: "varchar",
        nullable: false,
        default: "",
        size: "16",
      },
      {
        name: "date",
        dbName: "date",
        type: "date",
        nullable: false,
        default: "",
        size: "",
      },
      {
        name: "page_followers",
        dbName: "page_followers",
        type: "int",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "page_posts_impressions",
        dbName: "page_posts_impressions",
        type: "int",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "page_views_total",
        dbName: "page_views_total",
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
          source: "out.c-social-media-engagement" + InstanceIdShort() + ".pages_engagement",
          destination: "out.c-social-media-engagement" + InstanceIdShort() + ".pages_engagement.csv",
          columns: [
            "source",
            "date",
            "page_followers",
            "page_posts_impressions",
            "page_views_total",
          ],
        },
      ],
    },
  },
}

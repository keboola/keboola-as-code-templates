{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-social-media-engagement-" + InstanceIdShort() + ".pages_engagement",
          destination: "out.c-social-media-engagement-" + InstanceIdShort() + ".pages_engagement",
          changed_since: "adaptive",
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
  parameters: {
    tables: [
      {
        dbName: "pages_engagement",
        tableId: "out.c-social-media-engagement-" + InstanceIdShort() + ".pages_engagement",
        incremental: true,
        items: [
          {
            name: "source",
            dbName: "SOURCE",
            type: "STRING",
          },
          {
            name: "date",
            dbName: "DATE",
            type: "DATE",
          },
          {
            name: "page_followers",
            dbName: "PAGE_FOLLOWERS",
            type: "INTEGER",
          },
          {
            name: "page_posts_impressions",
            dbName: "PAGE_POSTS_IMPRESSIONS",
            type: "INTEGER",
          },
          {
            name: "page_views_total",
            dbName: "PAGE_VIEWS_TOTAL",
            type: "INTEGER",
          },
        ],
      },
    ],
  },
}

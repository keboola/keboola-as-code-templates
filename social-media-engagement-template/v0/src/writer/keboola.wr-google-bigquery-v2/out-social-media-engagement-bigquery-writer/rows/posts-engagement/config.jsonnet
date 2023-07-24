{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-social-media-engagement-" + InstanceIdShort() + ".posts_engagement",
          destination: "out.c-social-media-engagement-" + InstanceIdShort() + ".posts_engagement",
          changed_since: "adaptive",
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
  parameters: {
    tables: [
      {
        dbName: "posts_engagement",
        tableId: "out.c-social-media-engagement-" + InstanceIdShort() + ".posts_engagement",
        incremental: true,
        items: [
          {
            name: "uid",
            dbName: "UID",
            type: "STRING",
          },
          {
            name: "post_id",
            dbName: "POST_ID",
            type: "STRING",
          },
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
            name: "post_text",
            dbName: "POST_TEXT",
            type: "STRING",
          },
          {
            name: "shares",
            dbName: "SHARES",
            type: "INTEGER",
          },
          {
            name: "views",
            dbName: "VIEWS",
            type: "INTEGER",
          },
          {
            name: "likes",
            dbName: "LIKES",
            type: "INTEGER",
          },
          {
            name: "comments",
            dbName: "COMMENTS",
            type: "INTEGER",
          },
          {
            name: "all_reactions",
            dbName: "ALL_REACTIONS",
            type: "INTEGER",
          },
        ],
      },
    ],
  },
}

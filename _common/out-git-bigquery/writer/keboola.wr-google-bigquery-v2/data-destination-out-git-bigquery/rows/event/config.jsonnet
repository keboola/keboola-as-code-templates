{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-git-bdm-" + InstanceIdShort() + ".event",
          destination: "out.c-git-bdm-" + InstanceIdShort() + ".event.csv",
          changed_since: "adaptive",
          columns: [
            "event_id",
            "repository_id",
            "user_id",
            "event",
            "date",
            "url",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "EVENT",
        tableId: "out.c-git-bdm-" + InstanceIdShort() + ".event",
        incremental: true,
        items: [
          {
            name: "event_id",
            dbName: "event_id",
            type: "STRING",
          },
          {
            name: "repository_id",
            dbName: "repository_id",
            type: "STRING",
          },
          {
            name: "user_id",
            dbName: "user_id",
            type: "STRING",
          },
          {
            name: "event",
            dbName: "event",
            type: "STRING",
          },
          {
            name: "date",
            dbName: "date",
            type: "TIMESTAMP",
          },
          {
            name: "url",
            dbName: "url",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

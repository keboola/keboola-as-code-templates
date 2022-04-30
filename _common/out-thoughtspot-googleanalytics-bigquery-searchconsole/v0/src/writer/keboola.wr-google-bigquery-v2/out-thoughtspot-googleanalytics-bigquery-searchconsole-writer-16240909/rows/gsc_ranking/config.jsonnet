{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-bdm-" + InstanceIdShort() + ".gsc_ranking",
          changed_since: "-7 days",
          columns: ["page", "gsc_date", "gsc_average_ranking"],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "gsc_ranking",
        tableId: "out.c-thoughtspot-bdm-" + InstanceIdShort() + ".gsc_ranking",
        incremental: false,
        items: [
          {
            name: "page",
            dbName: "page",
            type: "STRING",
          },
          {
            name: "gsc_date",
            dbName: "gsc_date",
            type: "STRING",
          },
          {
            name: "gsc_average_ranking",
            dbName: "gsc_average_ranking",
            type: "STRING",
          }
        ],
      },
    ],
  },
}

{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-bdm-" + InstanceIdShort() + ".gsc_ranking",
          destination: "out.c-bdm-" + InstanceIdShort() + ".gsc_ranking.csv",
          changed_since: "",
          columns: ["page", "gsc_date", "gsc_average_ranking"],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "gsc_ranking",
        tableId: "out.c-bdm-" + InstanceIdShort() + ".gsc_ranking",
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

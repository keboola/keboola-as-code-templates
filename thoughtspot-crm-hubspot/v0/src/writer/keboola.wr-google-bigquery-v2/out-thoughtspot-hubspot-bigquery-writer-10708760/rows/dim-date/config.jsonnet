{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".DIM_DATE",
          destination: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".DIM_DATE.csv",
          changed_since: "",
          columns: [
            "DATE_ORDER",
            "DATE",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "DIM_DATE",
        tableId: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".DIM_DATE",
        incremental: false,
        items: [
          {
            name: "DATE_ORDER",
            dbName: "DATE_ORDER",
            type: "INTEGER",
          },
          {
            name: "DATE",
            dbName: "DATE",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

{
  parameters: {
    tableId: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".DIM_DATE",
    dbName: "DIM_DATE",
    incremental: false,
    primaryKey: [],
    items: [
      {
        name: "DATE_ORDER",
        dbName: "DATE_ORDER",
        type: "number",
        nullable: true,
        default: "",
        size: "38,0",
      },
      {
        name: "DATE",
        dbName: "DATE",
        type: "date",
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
          source: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".DIM_DATE",
          destination: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".DIM_DATE.csv",
          columns: [
            "DATE_ORDER",
            "DATE",
          ],
        },
      ],
    },
  },
}

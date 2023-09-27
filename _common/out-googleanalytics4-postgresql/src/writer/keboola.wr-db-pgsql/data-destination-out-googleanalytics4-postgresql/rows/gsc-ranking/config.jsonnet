{
  parameters: {
    tableId: "out.c-bdm-IPftXAqa.gsc_ranking",
    dbName: "gsc_ranking",
    incremental: true,
    primaryKey: [
      "page",
      "gsc_date",
      "gsc_average_ranking",
    ],
    items: [
      {
        name: "page",
        dbName: "page",
        type: "varchar",
        nullable: false,
        default: "",
        size: "1024",
      },
      {
        name: "gsc_date",
        dbName: "gsc_date",
        type: "date",
        nullable: false,
        default: "",
        size: "",
      },
      {
        name: "gsc_average_ranking",
        dbName: "gsc_average_ranking",
        type: "real",
        nullable: false,
        default: "",
        size: "",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-bdm-IPftXAqa.gsc_ranking",
          destination: "out.c-bdm-IPftXAqa.gsc_ranking.csv",
          columns: [
            "page",
            "gsc_date",
            "gsc_average_ranking",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

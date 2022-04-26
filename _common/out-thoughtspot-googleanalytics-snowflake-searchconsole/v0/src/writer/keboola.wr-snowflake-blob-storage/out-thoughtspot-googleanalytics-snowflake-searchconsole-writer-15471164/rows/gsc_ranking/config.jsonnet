{
  parameters: {
    tableId: "out.c-thoughtspot-bdm-" + ConfigId("out-thoughtspot-googleanalytics-snowflake-searchconsole-writer-15471164") + ".gsc_ranking",
    dbName: "gsc_ranking",
    incremental: false,
    primaryKey: [
      "id_TBE",
    ],
    items: [
      {
        name: "page",
        dbName: "page",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "gsc_date",
        dbName: "gsc_date",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "gsc_average_ranking",
        dbName: "gsc_average_ranking",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-bdm-" + ConfigId("out-thoughtspot-googleanalytics-snowflake-searchconsole-writer-15471164") + ".gsc_ranking",
          destination: "out.c-thoughtspot-bdm-" + ConfigId("out-thoughtspot-googleanalytics-snowflake-writer-searchconsole-15471164") + ".gsc_ranking.csv",
          columns: [
            "page",
            "gsc_date",
            "gsc_average_ranking"
          ],
        },
      ],
    },
  },
}

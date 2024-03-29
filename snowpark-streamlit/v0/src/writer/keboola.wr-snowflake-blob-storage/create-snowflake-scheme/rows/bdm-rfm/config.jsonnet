{
  parameters: {
    dbName: "bdm_rfm",
    incremental: false,
    items: [
      {
        dbName: "CUSTOMER_ID",
        default: "",
        name: "CUSTOMER_ID",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "SNAPSHOT_DATE",
        default: "",
        name: "SNAPSHOT_DATE",
        nullable: true,
        size: "",
        type: "date",
      },
      {
        dbName: "R_RAW",
        default: "",
        name: "R_RAW",
        nullable: true,
        size: "9,0",
        type: "number",
      },
      {
        dbName: "R_SCORE",
        default: "",
        name: "R_SCORE",
        nullable: true,
        size: "18,0",
        type: "number",
      },
      {
        dbName: "F_RAW",
        default: "",
        name: "F_RAW",
        nullable: true,
        size: "18,0",
        type: "number",
      },
      {
        dbName: "F_SCORE",
        default: "",
        name: "F_SCORE",
        nullable: true,
        size: "18,0",
        type: "number",
      },
      {
        dbName: "M_RAW",
        default: "",
        name: "M_RAW",
        nullable: true,
        size: "30,5",
        type: "number",
      },
      {
        dbName: "M_SCORE",
        default: "",
        name: "M_SCORE",
        nullable: true,
        size: "18,0",
        type: "number",
      },
      {
        dbName: "FINAL_SCORE",
        default: "",
        name: "FINAL_SCORE",
        nullable: true,
        size: "19,2",
        type: "number",
      },
      {
        dbName: "SEGMENT",
        default: "",
        name: "SEGMENT",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "SEGMENT_NR",
        default: "",
        name: "SEGMENT_NR",
        nullable: true,
        size: "38,0",
        type: "number",
      },
      {
        dbName: "PRE_SEG_1",
        default: "",
        name: "PRE_SEG_1",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "PRE_SEG_NUMBER_1",
        default: "",
        name: "PRE_SEG_NUMBER_1",
        nullable: true,
        size: "38,0",
        type: "number",
      },
      {
        dbName: "TIME_AS",
        default: "",
        name: "TIME_AS",
        nullable: true,
        size: "9,0",
        type: "number",
      },
      {
        dbName: "FIRST_SUCCEEDED_TRANSACTION_DATE",
        default: "",
        name: "FIRST_SUCCEEDED_TRANSACTION_DATE",
        nullable: true,
        size: "",
        type: "date",
      },
      {
        dbName: "ACTUAL_STATE",
        default: "",
        name: "ACTUAL_STATE",
        nullable: true,
        size: "",
        type: "boolean",
      },
    ],
    primaryKey: [],
    tableId: "out.c-ecommerce-wr-JPblfJtg.bdm_rfm",
  },
  storage: {
    input: {
      tables: [
        {
          columns: [
            "CUSTOMER_ID",
            "SNAPSHOT_DATE",
            "R_RAW",
            "R_SCORE",
            "F_RAW",
            "F_SCORE",
            "M_RAW",
            "M_SCORE",
            "FINAL_SCORE",
            "SEGMENT",
            "SEGMENT_NR",
            "PRE_SEG_1",
            "PRE_SEG_NUMBER_1",
            "TIME_AS",
            "FIRST_SUCCEEDED_TRANSACTION_DATE",
            "ACTUAL_STATE",
          ],
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_rfm.csv",
          source: "out.c-ecommerce-wr-JPblfJtg.bdm_rfm",
        },
      ],
    },
  },
}

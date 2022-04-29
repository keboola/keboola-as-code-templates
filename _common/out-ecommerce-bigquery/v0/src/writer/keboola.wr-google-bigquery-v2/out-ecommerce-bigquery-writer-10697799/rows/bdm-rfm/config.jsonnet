{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_rfm",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_rfm.csv",
          changed_since: "",
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
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "bdm_rfm",
        tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_rfm",
        incremental: false,
        items: [
          {
            name: "CUSTOMER_ID",
            dbName: "CUSTOMER_ID",
            type: "STRING",
          },
          {
            name: "SNAPSHOT_DATE",
            dbName: "SNAPSHOT_DATE",
            type: "TIMESTAMP",
          },
          {
            name: "R_RAW",
            dbName: "R_RAW",
            type: "FLOAT",
          },
          {
            name: "R_SCORE",
            dbName: "R_SCORE",
            type: "FLOAT",
          },
          {
            name: "F_RAW",
            dbName: "F_RAW",
            type: "FLOAT",
          },
          {
            name: "F_SCORE",
            dbName: "F_SCORE",
            type: "FLOAT",
          },
          {
            name: "M_RAW",
            dbName: "M_RAW",
            type: "FLOAT",
          },
          {
            name: "M_SCORE",
            dbName: "M_SCORE",
            type: "FLOAT",
          },
          {
            name: "FINAL_SCORE",
            dbName: "FINAL_SCORE",
            type: "STRING",
          },
          {
            name: "SEGMENT",
            dbName: "SEGMENT",
            type: "STRING",
          },
          {
            name: "SEGMENT_NR",
            dbName: "SEGMENT_NR",
            type: "FLOAT",
          },
          {
            name: "PRE_SEG_1",
            dbName: "PRE_SEG_1",
            type: "STRING",
          },
          {
            name: "PRE_SEG_NUMBER_1",
            dbName: "PRE_SEG_NUMBER_1",
            type: "FLOAT",
          },
          {
            name: "TIME_AS",
            dbName: "TIME_AS",
            type: "FLOAT",
          },
          {
            name: "FIRST_SUCCEEDED_TRANSACTION_DATE",
            dbName: "FIRST_SUCCEEDED_TRANSACTION_DATE",
            type: "TIMESTAMP",
          },
        ],
      },
    ],
  },
}

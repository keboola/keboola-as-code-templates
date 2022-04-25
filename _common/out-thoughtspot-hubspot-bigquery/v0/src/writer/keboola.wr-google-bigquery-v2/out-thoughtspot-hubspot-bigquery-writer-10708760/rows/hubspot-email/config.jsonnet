{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_EMAIL",
          destination: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_EMAIL.csv",
          changed_since: "",
          columns: [
            "HTML",
            "FROM_EMAIL",
            "SENDER_EMAIL",
            "SUBJECT",
            "TEXT",
            "STATUS",
            "FROM_FIRST_NAME",
            "FROM_LAST_NAME",
            "CREATED_AT",
            "CREATED_BY",
            "ID",
            "CONTACT_ID",
            "PRE_CUSTOMER_EMAIL",
            "CREATED_AT_DATE",
            "CREATED_AT_TIME",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "HUBSPOT_EMAIL",
        tableId: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_EMAIL",
        incremental: false,
        items: [
          {
            name: "HTML",
            dbName: "HTML",
            type: "STRING",
          },
          {
            name: "FROM_EMAIL",
            dbName: "FROM_EMAIL",
            type: "STRING",
          },
          {
            name: "SENDER_EMAIL",
            dbName: "SENDER_EMAIL",
            type: "STRING",
          },
          {
            name: "SUBJECT",
            dbName: "SUBJECT",
            type: "STRING",
          },
          {
            name: "TEXT",
            dbName: "TEXT",
            type: "STRING",
          },
          {
            name: "STATUS",
            dbName: "STATUS",
            type: "STRING",
          },
          {
            name: "FROM_FIRST_NAME",
            dbName: "FROM_FIRST_NAME",
            type: "STRING",
          },
          {
            name: "FROM_LAST_NAME",
            dbName: "FROM_LAST_NAME",
            type: "STRING",
          },
          {
            name: "CREATED_AT",
            dbName: "CREATED_AT",
            type: "STRING",
          },
          {
            name: "CREATED_BY",
            dbName: "CREATED_BY",
            type: "STRING",
          },
          {
            name: "ID",
            dbName: "ID",
            type: "STRING",
          },
          {
            name: "CONTACT_ID",
            dbName: "CONTACT_ID",
            type: "STRING",
          },
          {
            name: "PRE_CUSTOMER_EMAIL",
            dbName: "PRE_CUSTOMER_EMAIL",
            type: "FLOAT",
          },
          {
            name: "CREATED_AT_DATE",
            dbName: "CREATED_AT_DATE",
            type: "STRING",
          },
          {
            name: "CREATED_AT_TIME",
            dbName: "CREATED_AT_TIME",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

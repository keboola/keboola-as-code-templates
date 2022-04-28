{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_CALL",
          destination: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_CALL.csv",
          changed_since: "",
          columns: [
            "BODY",
            "TITLE",
            "CREATED_AT",
            "CREATED_BY",
            "UID",
            "CONTACT_ID",
            "CALL_OUTCOME",
            "PRE_CUSTOMER_CALL",
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
        dbName: "HUBSPOT_CALL",
        tableId: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_CALL",
        incremental: false,
        items: [
          {
            name: "BODY",
            dbName: "BODY",
            type: "STRING",
          },
          {
            name: "TITLE",
            dbName: "TITLE",
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
            name: "UID",
            dbName: "UID",
            type: "STRING",
          },
          {
            name: "CONTACT_ID",
            dbName: "CONTACT_ID",
            type: "STRING",
          },
          {
            name: "CALL_OUTCOME",
            dbName: "CALL_OUTCOME",
            type: "STRING",
          },
          {
            name: "PRE_CUSTOMER_CALL",
            dbName: "PRE_CUSTOMER_CALL",
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

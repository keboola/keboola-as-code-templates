{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_MEETING",
          destination: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_MEETING.csv",
          changed_since: "",
          columns: [
            "START_TIME",
            "END_TIME",
            "TITLE",
            "BODY",
            "MEETING_OUTCOME",
            "LOCATION",
            "CREATED_AT",
            "CREATED_BY",
            "ID",
            "CONTACT_ID",
            "PRE_CUSTOMER_MEET",
            "MEETING_DATE",
            "MEETING_TIME",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "HUBSPOT_MEETING",
        tableId: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_MEETING",
        incremental: false,
        items: [
          {
            name: "START_TIME",
            dbName: "START_TIME",
            type: "STRING",
          },
          {
            name: "END_TIME",
            dbName: "END_TIME",
            type: "STRING",
          },
          {
            name: "TITLE",
            dbName: "TITLE",
            type: "STRING",
          },
          {
            name: "BODY",
            dbName: "BODY",
            type: "STRING",
          },
          {
            name: "MEETING_OUTCOME",
            dbName: "MEETING_OUTCOME",
            type: "STRING",
          },
          {
            name: "LOCATION",
            dbName: "LOCATION",
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
            name: "PRE_CUSTOMER_MEET",
            dbName: "PRE_CUSTOMER_MEET",
            type: "FLOAT",
          },
          {
            name: "MEETING_DATE",
            dbName: "MEETING_DATE",
            type: "STRING",
          },
          {
            name: "MEETING_TIME",
            dbName: "MEETING_TIME",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

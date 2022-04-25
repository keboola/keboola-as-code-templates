{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_CONTACT_FORM_SUBMISSION",
          destination: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_CONTACT_FORM_SUBMISSION.csv",
          changed_since: "",
          columns: [
            "SUBMITTED_AT",
            "FORM_ID",
            "CONTACT_ID",
            "PRE_CUSTOMER_FORM",
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
        dbName: "HUBSPOT_CONTACT_FORM_SUBMISSION",
        tableId: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_CONTACT_FORM_SUBMISSION",
        incremental: false,
        items: [
          {
            name: "SUBMITTED_AT",
            dbName: "SUBMITTED_AT",
            type: "STRING",
          },
          {
            name: "FORM_ID",
            dbName: "FORM_ID",
            type: "STRING",
          },
          {
            name: "CONTACT_ID",
            dbName: "CONTACT_ID",
            type: "STRING",
          },
          {
            name: "PRE_CUSTOMER_FORM",
            dbName: "PRE_CUSTOMER_FORM",
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

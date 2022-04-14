{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_DEAL_CONTACT",
          destination: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_DEAL_CONTACT.csv",
          changed_since: "",
          columns: [
            "DEAL_ID",
            "CONTACT_ID",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "HUBSPOT_DEAL_CONTACT",
        tableId: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_DEAL_CONTACT",
        incremental: false,
        items: [
          {
            name: "DEAL_ID",
            dbName: "DEAL_ID",
            type: "STRING",
          },
          {
            name: "CONTACT_ID",
            dbName: "CONTACT_ID",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

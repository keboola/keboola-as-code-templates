{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_FORMS",
          destination: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_FORMS.csv",
          changed_since: "",
          columns: [
            "GUID",
            "FORM_NAME",
            "ACTION",
            "SUBMIT_TEXT",
            "LEAD_NURTURING_CAMPAIGN_ID",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "HUBSPOT_FORMS",
        tableId: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-bigquery-writer-10708760") + ".HUBSPOT_FORMS",
        incremental: false,
        items: [
          {
            name: "GUID",
            dbName: "GUID",
            type: "STRING",
          },
          {
            name: "FORM_NAME",
            dbName: "FORM_NAME",
            type: "STRING",
          },
          {
            name: "ACTION",
            dbName: "ACTION",
            type: "STRING",
          },
          {
            name: "SUBMIT_TEXT",
            dbName: "SUBMIT_TEXT",
            type: "STRING",
          },
          {
            name: "LEAD_NURTURING_CAMPAIGN_ID",
            dbName: "LEAD_NURTURING_CAMPAIGN_ID",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

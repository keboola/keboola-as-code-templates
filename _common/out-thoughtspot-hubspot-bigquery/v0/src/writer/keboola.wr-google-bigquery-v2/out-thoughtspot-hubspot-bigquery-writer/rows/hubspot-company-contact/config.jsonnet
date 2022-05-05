{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_COMPANY_CONTACT",
          destination: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_COMPANY_CONTACT.csv",
          changed_since: "",
          columns: [
            "CONTACT_ID",
            "COMPANY_ID",
            "TYPE",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "HUBSPOT_COMPANY_CONTACT",
        tableId: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_COMPANY_CONTACT",
        incremental: false,
        items: [
          {
            name: "CONTACT_ID",
            dbName: "CONTACT_ID",
            type: "STRING",
          },
          {
            name: "COMPANY_ID",
            dbName: "COMPANY_ID",
            type: "STRING",
          },
          {
            name: "TYPE",
            dbName: "TYPE",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

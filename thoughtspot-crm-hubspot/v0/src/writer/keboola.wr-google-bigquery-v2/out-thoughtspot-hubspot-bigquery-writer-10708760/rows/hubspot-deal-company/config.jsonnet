{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_DEAL_COMPANY",
          destination: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_DEAL_COMPANY.csv",
          changed_since: "",
          columns: [
            "DEAL_ID",
            "COMPANY_ID",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "HUBSPOT_DEAL_COMPANY",
        tableId: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_DEAL_COMPANY",
        incremental: false,
        items: [
          {
            name: "DEAL_ID",
            dbName: "DEAL_ID",
            type: "STRING",
          },
          {
            name: "COMPANY_ID",
            dbName: "COMPANY_ID",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

{
  parameters: {
    tableId: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-snowflake-writer-10708760") + ".HUBSPOT_DEAL_COMPANY",
    dbName: "HUBSPOT_DEAL_COMPANY",
    incremental: false,
    primaryKey: [],
    items: [
      {
        name: "DEAL_ID",
        dbName: "DEAL_ID",
        type: "double",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "COMPANY_ID",
        dbName: "COMPANY_ID",
        type: "double",
        nullable: true,
        default: "",
        size: "",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-snowflake-writer-10708760") + ".HUBSPOT_DEAL_COMPANY",
          destination: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-snowflake-writer-10708760") + ".HUBSPOT_DEAL_COMPANY.csv",
          columns: [
            "DEAL_ID",
            "COMPANY_ID",
          ],
        },
      ],
    },
  },
}

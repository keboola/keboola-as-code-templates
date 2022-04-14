{
  parameters: {
    tableId: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-snowflake-writer-10708760") + ".HUBSPOT_DEAL_CONTACT",
    dbName: "HUBSPOT_DEAL_CONTACT",
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
        name: "CONTACT_ID",
        dbName: "CONTACT_ID",
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
          source: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-snowflake-writer-10708760") + ".HUBSPOT_DEAL_CONTACT",
          destination: "out.c-thoughtspot-wr-" + ConfigId("out-thoughtspot-hubspot-snowflake-writer-10708760") + ".HUBSPOT_DEAL_CONTACT.csv",
          columns: [
            "DEAL_ID",
            "CONTACT_ID",
          ],
        },
      ],
    },
  },
}

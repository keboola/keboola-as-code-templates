{
  parameters: {
    tableId: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_COMPANY_CONTACT",
    dbName: "HUBSPOT_COMPANY_CONTACT",
    incremental: false,
    primaryKey: [],
    items: [
      {
        name: "CONTACT_ID",
        dbName: "CONTACT_ID",
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
      {
        name: "TYPE",
        dbName: "TYPE",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_COMPANY_CONTACT",
          destination: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_COMPANY_CONTACT.csv",
          columns: [
            "CONTACT_ID",
            "COMPANY_ID",
            "TYPE",
          ],
        },
      ],
    },
  },
}

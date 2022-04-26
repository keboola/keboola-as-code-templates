{
  parameters: {
    tableId: "out.c-crm-wr-"+if std.length("ex-hubspot-crm-api-token") > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length("ex-salesforce-v2-username") > 0 then ConfigId("in-crm-salesforce-extractor-12706099")+".contact",
    dbName: "contact",
    incremental: false,
    primaryKey: [
      "contact_id",
    ],
    items: [
      {
        name: "contact_id",
        dbName: "contact_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "contact",
        dbName: "contact",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "email",
        dbName: "email",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "contact_type",
        dbName: "contact_type",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "date_created",
        dbName: "date_created",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "lead_source",
        dbName: "lead_source",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "lead_converted",
        dbName: "lead_converted",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-wr-"+if std.length("ex-hubspot-crm-api-token") > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length("ex-salesforce-v2-username") > 0 then ConfigId("in-crm-salesforce-extractor-12706099")+".contact",
          destination: "out.c-crm-wr-"+if std.length("ex-hubspot-crm-api-token") > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length("ex-salesforce-v2-username") > 0 then ConfigId("in-crm-salesforce-extractor-12706099")+".contact.csv",
          columns: [
            "contact_id",
            "contact",
            "email",
            "contact_type",
            "date_created",
            "lead_source",
            "lead_converted",
          ],
        },
      ],
    },
  },
}

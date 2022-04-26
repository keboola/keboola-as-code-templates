{
  parameters: {
    tableId: "out.c-crm-wr-"+if std.length("ex-hubspot-crm-api-token") > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length("ex-salesforce-v2-username") > 0 then ConfigId("in-crm-salesforce-extractor-12706099")+".company",
    dbName: "company",
    incremental: false,
    primaryKey: [
      "company_id",
    ],
    items: [
      {
        name: "company_id",
        dbName: "company_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "company",
        dbName: "company",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "website",
        dbName: "website",
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
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-wr-"+if std.length("ex-hubspot-crm-api-token") > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length("ex-salesforce-v2-username") > 0 then ConfigId("in-crm-salesforce-extractor-12706099")+".company",
          destination: "out.c-crm-wr-"+if std.length("ex-hubspot-crm-api-token") > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length("ex-salesforce-v2-username") > 0 then ConfigId("in-crm-salesforce-extractor-12706099")+".company.csv",
          columns: [
            "company_id",
            "company",
            "website",
            "date_created",
          ],
        },
      ],
    },
  },
}

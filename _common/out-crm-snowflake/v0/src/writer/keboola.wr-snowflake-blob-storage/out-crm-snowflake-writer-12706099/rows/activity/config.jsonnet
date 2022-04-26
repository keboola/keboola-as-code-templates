{
  parameters: {
    tableId: "out.c-crm-wr-"+if std.length("ex-hubspot-crm-api-token") > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length("ex-salesforce-v2-username") > 0 then ConfigId("in-crm-salesforce-extractor-12706099")+".activity",
    dbName: "activity",
    incremental: false,
    primaryKey: [
      "activity_id",
    ],
    items: [
      {
        name: "activity_id",
        dbName: "activity_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "employee_id",
        dbName: "employee_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "contact_id",
        dbName: "contact_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "opportunity_id",
        dbName: "opportunity_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "activity",
        dbName: "activity",
        type: "varchar",
        nullable: false,
        default: "",
        size: "1028",
      },
      {
        name: "activity_date",
        dbName: "activity_date",
        type: "timestamp",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "activity_duration_m",
        dbName: "activity_duration_m",
        type: "integer",
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
          source: "out.c-crm-wr-"+if std.length("ex-hubspot-crm-api-token") > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length("ex-salesforce-v2-username") > 0 then ConfigId("in-crm-salesforce-extractor-12706099")+".activity",
          destination: "out.c-crm-wr-"+if std.length("ex-hubspot-crm-api-token") > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length("ex-salesforce-v2-username") > 0 then ConfigId("in-crm-salesforce-extractor-12706099")+".activity.csv",
          columns: [
            "activity_id",
            "employee_id",
            "contact_id",
            "opportunity_id",
            "activity",
            "activity_date",
            "activity_duration_m",
          ],
        },
      ],
    },
  },
}

{
  parameters: {
    tableId: "out.c-crm-wr-"+if std.length("ex-hubspot-crm-api-token") > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length("ex-salesforce-v2-username") > 0 then ConfigId("in-crm-salesforce-extractor-12706099")+".employee",
    dbName: "employee",
    incremental: false,
    primaryKey: [
      "employee_id",
    ],
    items: [
      {
        name: "employee_id",
        dbName: "employee_id",
        type: "varchar",
        nullable: false,
        default: "",
        size: "255",
      },
      {
        name: "employee",
        dbName: "employee",
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
        name: "position",
        dbName: "position",
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
          source: "out.c-crm-wr-"+if std.length("ex-hubspot-crm-api-token") > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length("ex-salesforce-v2-username") > 0 then ConfigId("in-crm-salesforce-extractor-12706099")+".employee",
          destination: "out.c-crm-wr-"+if std.length("ex-hubspot-crm-api-token") > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length("ex-salesforce-v2-username") > 0 then ConfigId("in-crm-salesforce-extractor-12706099")+".employee.csv",
          columns: [
            "employee_id",
            "employee",
            "email",
            "position",
          ],
        },
      ],
    },
  },
}

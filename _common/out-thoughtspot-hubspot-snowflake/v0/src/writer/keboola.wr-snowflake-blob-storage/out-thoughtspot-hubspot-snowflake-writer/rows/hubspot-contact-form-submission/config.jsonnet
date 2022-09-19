{
  parameters: {
    tableId: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_CONTACT_FORM_SUBMISSION",
    dbName: "HUBSPOT_CONTACT_FORM_SUBMISSION",
    incremental: false,
    primaryKey: [],
    items: [
      {
        name: "SUBMITTED_AT",
        dbName: "SUBMITTED_AT",
        type: "datetime",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "FORM_ID",
        dbName: "FORM_ID",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "CONTACT_ID",
        dbName: "CONTACT_ID",
        type: "double",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "PRE_CUSTOMER_FORM",
        dbName: "PRE_CUSTOMER_FORM",
        type: "double",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "CREATED_AT_DATE",
        dbName: "CREATED_AT_DATE",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "CREATED_AT_TIME",
        dbName: "CREATED_AT_TIME",
        type: "time",
        nullable: true,
        default: "",
        size: "9",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_CONTACT_FORM_SUBMISSION",
          destination: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_CONTACT_FORM_SUBMISSION.csv",
          columns: [
            "SUBMITTED_AT",
            "FORM_ID",
            "CONTACT_ID",
            "PRE_CUSTOMER_FORM",
            "CREATED_AT_DATE",
            "CREATED_AT_TIME",
          ],
        },
      ],
    },
  },
}

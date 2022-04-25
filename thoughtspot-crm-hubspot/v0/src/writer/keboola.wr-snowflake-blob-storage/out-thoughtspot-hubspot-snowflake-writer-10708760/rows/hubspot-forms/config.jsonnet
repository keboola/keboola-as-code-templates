{
  parameters: {
    tableId: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_FORMS",
    dbName: "HUBSPOT_FORMS",
    incremental: false,
    primaryKey: [],
    items: [
      {
        name: "GUID",
        dbName: "GUID",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "FORM_NAME",
        dbName: "FORM_NAME",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "ACTION",
        dbName: "ACTION",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "SUBMIT_TEXT",
        dbName: "SUBMIT_TEXT",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "LEAD_NURTURING_CAMPAIGN_ID",
        dbName: "LEAD_NURTURING_CAMPAIGN_ID",
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
          source: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_FORMS",
          destination: "out.c-thoughtspot-wr-" + ConfigId("in-thoughtspot-hubspot-extractor-10708760") + ".HUBSPOT_FORMS.csv",
          columns: [
            "GUID",
            "FORM_NAME",
            "ACTION",
            "SUBMIT_TEXT",
            "LEAD_NURTURING_CAMPAIGN_ID",
          ],
        },
      ],
    },
  },
}

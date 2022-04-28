{
  parameters: {
    tableId: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_MARKETING_CAMPAIGN_SENT_DATE",
    dbName: "HUBSPOT_MARKETING_CAMPAIGN_SENT_DATE",
    incremental: false,
    primaryKey: [],
    items: [
      {
        name: "CAMPAIGN_ID",
        dbName: "CAMPAIGN_ID",
        type: "double",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "DATE_CAMPAIGN_SENT",
        dbName: "DATE_CAMPAIGN_SENT",
        type: "datetime",
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
          source: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_MARKETING_CAMPAIGN_SENT_DATE",
          destination: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_MARKETING_CAMPAIGN_SENT_DATE.csv",
          columns: [
            "CAMPAIGN_ID",
            "DATE_CAMPAIGN_SENT",
          ],
        },
      ],
    },
  },
}

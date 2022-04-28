{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_MARKETING_CAMPAIGN_SENT_DATE",
          destination: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_MARKETING_CAMPAIGN_SENT_DATE.csv",
          changed_since: "",
          columns: [
            "CAMPAIGN_ID",
            "DATE_CAMPAIGN_SENT",
          ],
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        dbName: "HUBSPOT_MARKETING_CAMPAIGN_SENT_DATE",
        tableId: "out.c-thoughtspot-wr-" + InstanceIdShort() + ".HUBSPOT_MARKETING_CAMPAIGN_SENT_DATE",
        incremental: false,
        items: [
          {
            name: "CAMPAIGN_ID",
            dbName: "CAMPAIGN_ID",
            type: "STRING",
          },
          {
            name: "DATE_CAMPAIGN_SENT",
            dbName: "DATE_CAMPAIGN_SENT",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

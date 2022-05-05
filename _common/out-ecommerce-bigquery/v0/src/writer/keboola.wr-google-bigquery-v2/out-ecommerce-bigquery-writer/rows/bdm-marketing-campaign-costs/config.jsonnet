{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_marketing_campaign_costs",
          destination: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_marketing_campaign_costs.csv",
          columns: [
            "MARKETING_CAMPAIGN_COSTS_ID",
            "SOURCE",
            "DATE",
            "CAMPAIGN",
            "IMPRESSIONS",
            "CLICKS",
            "COST",
          ],
          changed_since: "",
        },
      ],
    },
  },
  parameters: {
    tables: [
      {
        tableId: "out.c-ecommerce-wr-"+InstanceIdShort()+".bdm_marketing_campaign_costs",
        dbName: "bdm_marketing_campaign_costs",
        incremental: false,
        items: [
          {
            name: "MARKETING_CAMPAIGN_COSTS_ID",
            dbName: "MARKETING_CAMPAIGN_COSTS_ID",
            type: "STRING",
          },
          {
            name: "SOURCE",
            dbName: "SOURCE",
            type: "STRING",
          },
          {
            name: "DATE",
            dbName: "DATE",
            type: "STRING",
          },
          {
            name: "CAMPAIGN",
            dbName: "CAMPAIGN",
            type: "STRING",
          },
          {
            name: "IMPRESSIONS",
            dbName: "IMPRESSIONS",
            type: "STRING",
          },
          {
            name: "CLICKS",
            dbName: "CLICKS",
            type: "STRING",
          },
          {
            name: "COST",
            dbName: "COST",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

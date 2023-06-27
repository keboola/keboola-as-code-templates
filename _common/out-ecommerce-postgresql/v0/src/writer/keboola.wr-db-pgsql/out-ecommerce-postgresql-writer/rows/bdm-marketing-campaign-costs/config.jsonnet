{
  parameters: {
    tableId: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_marketing_campaign_costs",
    dbName: "bdm_marketing_campaign_costs",
    incremental: false,
    primaryKey: [
      "MARKETING_CAMPAIGN_COSTS_ID",
    ],
    items: [
      {
        name: "MARKETING_CAMPAIGN_COSTS_ID",
        dbName: "MARKETING_CAMPAIGN_COSTS_ID",
        type: "varchar",
        nullable: false,
        default: "",
        size: "10485760",
      },
      {
        name: "SOURCE",
        dbName: "SOURCE",
        type: "varchar",
        nullable: true,
        default: "",
        size: "20",
      },
      {
        name: "DATE",
        dbName: "DATE",
        type: "date",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "CAMPAIGN",
        dbName: "CAMPAIGN",
        type: "varchar",
        nullable: true,
        default: "",
        size: "10485760",
      },
      {
        name: "IMPRESSIONS",
        dbName: "IMPRESSIONS",
        type: "real",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "CLICKS",
        dbName: "CLICKS",
        type: "real",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "COST",
        dbName: "COST",
        type: "real",
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
          source: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_marketing_campaign_costs",
          destination: "out.c-ecommerce-wr-" + InstanceIdShort() + ".bdm_marketing_campaign_costs.csv",
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
}

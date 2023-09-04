{
  parameters: {
    dbName: "bdm_marketing_campaign_costs_monthly",
    incremental: false,
    items: [
      {
        dbName: "MARKETING_CAMPAIGN_COSTS_ID",
        default: "",
        name: "MARKETING_CAMPAIGN_COSTS_ID",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "SOURCE",
        default: "",
        name: "SOURCE",
        nullable: true,
        size: "20",
        type: "varchar",
      },
      {
        dbName: "DATE",
        default: "",
        name: "DATE",
        nullable: true,
        size: "",
        type: "date",
      },
      {
        dbName: "CAMPAIGN",
        default: "",
        name: "CAMPAIGN",
        nullable: true,
        size: "16777216",
        type: "varchar",
      },
      {
        dbName: "IMPRESSIONS",
        default: "",
        name: "IMPRESSIONS",
        nullable: true,
        size: "",
        type: "float",
      },
      {
        dbName: "CLICKS",
        default: "",
        name: "CLICKS",
        nullable: true,
        size: "",
        type: "float",
      },
      {
        dbName: "COST",
        default: "",
        name: "COST",
        nullable: true,
        size: "",
        type: "float",
      },
    ],
    primaryKey: [
      "MARKETING_CAMPAIGN_COSTS_ID",
    ],
    tableId: "out.c-ecommerce-wr-JPblfJtg.bdm_marketing_campaign_costs_monthly",
  },
  storage: {
    input: {
      tables: [
        {
          columns: [
            "MARKETING_CAMPAIGN_COSTS_ID",
            "SOURCE",
            "DATE",
            "CAMPAIGN",
            "IMPRESSIONS",
            "CLICKS",
            "COST",
          ],
          destination: "out.c-ecommerce-wr-JPblfJtg.bdm_marketing_campaign_costs_monthly.csv",
          source: "out.c-ecommerce-wr-JPblfJtg.bdm_marketing_campaign_costs_monthly",
        },
      ],
    },
  },
}

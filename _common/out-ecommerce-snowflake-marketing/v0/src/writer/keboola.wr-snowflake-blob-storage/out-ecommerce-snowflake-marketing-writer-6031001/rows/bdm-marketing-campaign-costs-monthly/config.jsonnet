{
  parameters: {
    tableId: "out.c-ecommerce-wr-"+ConfigId("out-ecommerce-snowflake-marketing-writer-6031001")+".bdm_marketing_campaign_costs_monthly",
    dbName: "bdm_marketing_campaign_costs_monthly",
    incremental: false,
    primaryKey: [
      "MARKETING_CAMPAIGN_COSTS_ID",
    ],
    items: [
      {
        name: "MARKETING_CAMPAIGN_COSTS_ID",
        dbName: "MARKETING_CAMPAIGN_COSTS_ID",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "SOURCE",
        dbName: "SOURCE",
        type: "varchar",
        nullable: true,
        default: "",
        size: "8",
      },
      {
        name: "DATE",
        dbName: "DATE",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "CAMPAIGN",
        dbName: "CAMPAIGN",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "IMPRESSIONS",
        dbName: "IMPRESSIONS",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "CLICKS",
        dbName: "CLICKS",
        type: "float",
        nullable: true,
        default: "",
        size: "",
      },
      {
        name: "COST",
        dbName: "COST",
        type: "float",
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
          source: "out.c-ecommerce-wr-"+ConfigId("out-ecommerce-snowflake-marketing-writer-6031001")+".bdm_marketing_campaign_costs_monthly",
          destination: "out.c-ecommerce-wr-"+ConfigId("out-ecommerce-snowflake-marketing-writer-6031001")+".bdm_marketing_campaign_costs_monthly.csv",
          columns: [
            "MARKETING_CAMPAIGN_COSTS_ID",
            "SOURCE",
            "DATE",
            "CAMPAIGN",
            "IMPRESSIONS",
            "CLICKS",
            "COST",
          ],
        },
      ],
    },
  },
}

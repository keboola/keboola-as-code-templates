{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing",
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing.csv",
          changed_since: "adaptive",
          columns: [
            "online_marketing_traffic_id",
            "account_name",
            "date",
            "source",
            "medium",
            "campaign",
            "domain",
            "impressions",
            "clicks",
            "costs_cpc",
            "costs_conversion"
          ],
        },
      ],
    },
  },
  parameters: {
        tableId: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing",
        dbName: "online_marketing",
        incremental: true,
        primaryKey: ["online_marketing_traffic_id"],
        items: [
          {
            name: "online_marketing_traffic_id",
            dbName: "online_marketing_traffic_id",
            type: "varchar",
            nullable: false,
            default: "",
            size: "10485760"
          },
          {
            name: "account_name",
            dbName: "account_name",
            type: "varchar",
            nullable: true,
            default: "",
            size: "10485760"
          },
          {
            name: "date",
            dbName: "date",
            type: "varchar",
            nullable: true,
            default: "",
            size: "10485760"
          },
          {
            name: "source",
            dbName: "source",
            type: "varchar",
            nullable: true,
            default: "",
            size: "10485760"
          },
          {
            name: "medium",
            dbName: "medium",
            type: "varchar",
            nullable: true,
            default: "",
            size: "10485760"
          },
          {
            name: "campaign",
            dbName: "campaign",
            type: "varchar",
            nullable: true,
            default: "",
            size: "10485760"
          },
          {
            name: "domain",
            dbName: "domain",
            type: "varchar",
            nullable: true,
            default: "",
            size: "10485760"
          },
          {
            name: "impressions",
            dbName: "impressions",
            type: "real",
            nullable: true,
            default: "",
            size: ""
          },
          {
            name: "clicks",
            dbName: "clicks",
            type: "numeric",
            nullable: true,
            default: "",
            size: "38,0"
          },
          {
            name: "costs_cpc",
            dbName: "costs_cpc",
            type: "numeric",
            nullable: true,
            default: "",
            size: "38,5"
          },
          {
            name: "costs_coversion",
            dbName: "costs_coversion",
            type: "numeric",
            nullable: true,
            default: "",
            size: "38,5"
          },
        ],
  },
}

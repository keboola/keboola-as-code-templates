{
  parameters: {
    tableId: "out.c-marketing-bdm-" + InstanceIdShort() + ".keywords_adgroup",
    dbName: "keywords_adgroup",
    incremental: true,
    primaryKey: [
      "keyword_id",
    ],
    items: [
      {
        name: "keyword_id",
        dbName: "keyword_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "online_marketing_traffic_id",
        dbName: "online_marketing_traffic_id",
        type: "varchar",
        nullable: true,
        default: "",
        size: "16777216",
      },
      {
        name: "keyword",
        dbName: "keyword",
        type: "varchar",
        nullable: false,
        default: "",
        size: "16777216",
      },
      {
        name: "ad_group",
        dbName: "ad_group",
        type: "varchar",
        nullable: false,
        default: "",
        size: "16777216",
      },
    ],
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-marketing-bdm-" + InstanceIdShort() + ".keywords_adgroup",
          destination: "out.c-marketing-bdm-" + InstanceIdShort() + ".keywords_adgroup.csv",
          columns: [
            "keyword_id",
            "online_marketing_traffic_id",
            "keyword",
            "ad_group",
          ],
          changed_since: "adaptive",
        },
      ],
    },
  },
}

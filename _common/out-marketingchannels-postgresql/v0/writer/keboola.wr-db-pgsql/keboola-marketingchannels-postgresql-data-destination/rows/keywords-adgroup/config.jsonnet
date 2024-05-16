{
  storage: {
    input: {
      tables: [
        {
          source: "out.c-marketing-bdm-" + InstanceIdShort() + ".keywords_adgroup",
          destination: "out.c-marketing-bdm-" + InstanceIdShort() + ".keywords_adgroup.csv",
          changed_since: "adaptive",
          columns: [
            "keyword_id",
            "online_marketing_traffic_id",
            "keyword",
            "ad_group",
          ],
        },
      ],
    },
  },
  parameters: {
        tableId: "out.c-marketing-bdm-" + InstanceIdShort() + ".keywords_adgroup",
        dbName: "keywords_adgroup",
        incremental: true,
        primaryKey: ["keyword_id"],
        items: [
          {
            name: "keyword_id",
            dbName: "keyword_id",
            type: "varchar",
            nullable: false,
            default: "",
            size: "10485760",
          },
          {
            name: "online_marketing_traffic_id",
            dbName: "online_marketing_traffic_id",
            type: "varchar",
            nullable: true,
            default: "",
            size: "10485760",
          },
          {
            name: "keyword",
            dbName: "keyword",
            type: "varchar",
            nullable: true,
            default: "",
            size: "10485760",
          },
          {
            name: "ad_group",
            dbName: "ad_group",
            type: "varchar",
            nullable: true,
            default: "",
            size: "10485760",
          },
        ],
  },
}

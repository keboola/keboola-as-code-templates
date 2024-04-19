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
    tables: [
      {
        dbName: "keywords_adgroup",
        tableId: "out.c-marketing-bdm-" + InstanceIdShort() + ".keywords_adgroup",
        incremental: true,
        items: [
          {
            name: "keyword_id",
            dbName: "keyword_id",
            type: "STRING",
          },
          {
            name: "online_marketing_traffic_id",
            dbName: "online_marketing_traffic_id",
            type: "STRING",
          },
          {
            name: "keyword",
            dbName: "keyword",
            type: "STRING",
          },
          {
            name: "ad_group",
            dbName: "ad_group",
            type: "STRING",
          },
        ],
      },
    ],
  },
}

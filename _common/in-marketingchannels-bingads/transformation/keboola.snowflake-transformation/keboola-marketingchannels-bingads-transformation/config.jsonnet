{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-bing_ads-" + ConfigId("keboola-marketingchannels-bingads-data-source") + ".campaignperformance",
          destination: "Bing_Ads_campaignperformance",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-bing_ads-" + ConfigId("keboola-marketingchannels-bingads-data-source") + ".campaigns",
          destination: "Bing_Ads_campaigns",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".bingads",
          source: "out_bingads",
          primary_key: [
            "bing_id",
          ],
        },
        {
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".accounts",
          primary_key: [
            "ads_system",
            "account_id",
            "account_name",
          ],
          source: "accounts",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing",
          source: "out_marketing",
          primary_key: [
            "online_marketing_traffic_id",
          ],
        },
      ],
    },
  },
}

{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-facebook-ads-" + ConfigId("keboola-marketingchannels-facebook-data-source") + ".accounts",
          destination: "Facebook_Ads_accounts",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-facebook-ads-" + ConfigId("keboola-marketingchannels-facebook-data-source") + ".ads",
          destination: "Facebook_Ads_ads",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-facebook-ads-" + ConfigId("keboola-marketingchannels-facebook-data-source") + ".ads_insights",
          destination: "Facebook_Ads_ads_insights",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-facebook-ads-" + ConfigId("keboola-marketingchannels-facebook-data-source") + ".ads_insights_adcreatives",
          destination: "Facebook_Ads_ads_insights_adcreatives",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-facebook-ads-" + ConfigId("keboola-marketingchannels-facebook-data-source") + ".adsets",
          destination: "Facebook_Ads_adsets",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-facebook-ads-" + ConfigId("keboola-marketingchannels-facebook-data-source") + ".campaigns",
          destination: "Facebook_Ads_campaigns",
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
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".facebook_ads",
          source: "out_facebook",
          primary_key: [
            "facebook_ads_id",
          ],
        },
        {
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".accounts",
          source: "accounts",
          primary_key: [
            "ads_system",
            "account_id",
            "account_name",
          ],
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

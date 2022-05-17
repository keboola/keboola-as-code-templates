{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-google-ads-" + ConfigId("keboola-marketingchannels-googleads-data-source") + ".campaign",
          destination: "Google_Adwords_campaigns",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-google-ads-" + ConfigId("keboola-marketingchannels-googleads-data-source") + ".customer",
          destination: "Google_Adwords_customers",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-google-ads-" + ConfigId("keboola-marketingchannels-googleads-data-source") + ".report-url_adwords",
          destination: "Google_Adwords_url_adwords",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-google-ads-" + ConfigId("keboola-marketingchannels-googleads-data-source") + ".report-ad_groups",
          destination: "Google_Adwords_ad_groups",
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
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".adwords",
          source: "out_adwords",
          primary_key: [
            "adwords_id",
          ],
        },
        {
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing",
          primary_key: [
            "online_marketing_traffic_id",
          ],
          source: "out_marketing",
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
      ],
    },
  },
}

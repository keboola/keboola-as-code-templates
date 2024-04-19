{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          columns: [],
          destination: "accounts",
          source: "out.c-marketing-tr-" + InstanceIdShort() + ".accounts",
          where_column: "",
          where_operator: "eq",
          where_values: [],
        },
        {
          columns: [],
          destination: "online_marketing",
          source: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing",
          where_column: "",
          where_operator: "eq",
          where_values: [],
        },
        {
          source: "in.c-keboola-ex-google-analytics-v4-" + ConfigId("in-marketingchannels-googleanalytics4-data-source") + ".ga4_basic_sessions",
          destination: "ga4_basic_sessions",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-keboola-ex-google-analytics-v4-" + ConfigId("in-marketingchannels-googleanalytics4-data-source") + ".ga4_basic_transactions",
          destination: "ga4_basic_transactions",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".ga4_traffic",
          source: "out_ga4_traffic",
          primary_key: [
            "ga_traffic_id",
          ],
        },
        {
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".ga4_transactions",
          source: "out_ga4_transactions",
          primary_key: [
            "ga_transactions_id",
          ],
        },
        {
          destination: "out.c-marketing-bdm-" + InstanceIdShort() + ".keywords_adgroup",
          primary_key: [
            "keyword_id",
          ],
          source: "out_keyword_ad_group",
        },
        {
          destination: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_transactions",
          source: "out_marketing_transactions",
          primary_key: [
            "online_marketing_transactions_id",
          ],
        },
        {
          destination: "out.c-marketing-bdm-" + InstanceIdShort() + ".online_marketing_traffic",
          source: "out_marketing",
          primary_key: [
            "online_marketing_traffic_id",
          ],
        },
      ],
    },
  },
}

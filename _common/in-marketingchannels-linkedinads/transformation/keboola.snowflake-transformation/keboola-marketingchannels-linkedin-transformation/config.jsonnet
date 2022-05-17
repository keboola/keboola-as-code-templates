{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-leochan-ex-linkedin-" + ConfigId("keboola-marketingchannels-linkedin-data-source") + ".ads_basic_stats",
          destination: "linkedinraw_ads_basic_stats",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-leochan-ex-linkedin-" + ConfigId("keboola-marketingchannels-linkedin-data-source") + ".ads_cost",
          destination: "linkedinraw_ads_cost",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-leochan-ex-linkedin-" + ConfigId("keboola-marketingchannels-linkedin-data-source") + ".campaigns",
          destination: "linkedinraw_campaigns",
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
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".linkedin",
          source: "out_linkedin",
          primary_key: [
            "linkedin_id",
          ],
        },
        {
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing",
          source: "out_marketing",
          primary_key: [
            "online_marketing_traffic_id",
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
      ],
    },
  },
}

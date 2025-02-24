{
  parameters: {},
  storage: {
    input: {
      tables: std.filter(function(v) v != null,[
        if InputIsAvailable("ex-bingads-account-id") then
        {
          source: "in.c-kds-team-ex-bing-ads-" + ConfigId("keboola-marketingchannels-bingads-data-source") + ".AdGroupPerformance_Daily_Report",
          destination: "Bing_Ads_campaignperformance",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        if InputIsAvailable("ex-bingads-account-id") then
        {
          source: "in.c-kds-team-ex-bing-ads-" + ConfigId("keboola-marketingchannels-bingads-data-source") + ".Campaigns",
          destination: "Bing_Ads_campaigns",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        if InputIsAvailable("oauth-facebookads") then
        {
          source: "in.c-keboola-ex-facebook-ads-" + ConfigId("keboola-marketingchannels-facebook-data-source") + ".accounts",
          destination: "Facebook_Ads_accounts",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        if InputIsAvailable("oauth-facebookads") then
        {
          source: "in.c-keboola-ex-facebook-ads-" + ConfigId("keboola-marketingchannels-facebook-data-source") + ".ads",
          destination: "Facebook_Ads_ads",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        if InputIsAvailable("oauth-facebookads") then
        {
          source: "in.c-keboola-ex-facebook-ads-" + ConfigId("keboola-marketingchannels-facebook-data-source") + ".ads_insights",
          destination: "Facebook_Ads_ads_insights",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        if InputIsAvailable("oauth-facebookads") then
        {
          source: "in.c-keboola-ex-facebook-ads-" + ConfigId("keboola-marketingchannels-facebook-data-source") + ".ads_insights_adcreatives",
          destination: "Facebook_Ads_ads_insights_adcreatives",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        if InputIsAvailable("oauth-facebookads") then
        {
          source: "in.c-keboola-ex-facebook-ads-" + ConfigId("keboola-marketingchannels-facebook-data-source") + ".adsets",
          destination: "Facebook_Ads_adsets",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        if InputIsAvailable("oauth-facebookads") then
        {
          source: "in.c-keboola-ex-facebook-ads-" + ConfigId("keboola-marketingchannels-facebook-data-source") + ".campaigns",
          destination: "Facebook_Ads_campaigns",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        if InputIsAvailable("oauth-googleads") then
        {
          source: "in.c-keboola-ex-google-ads-" + ConfigId("keboola-marketingchannels-googleads-data-source") + ".campaign",
          destination: "Google_Adwords_campaigns",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        if InputIsAvailable("oauth-googleads") then
        {
          source: "in.c-keboola-ex-google-ads-" + ConfigId("keboola-marketingchannels-googleads-data-source") + ".customer",
          destination: "Google_Adwords_customers",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        if InputIsAvailable("oauth-googleads") then
        {
          source: "in.c-keboola-ex-google-ads-" + ConfigId("keboola-marketingchannels-googleads-data-source") + ".report-ad_groups",
          destination: "Google_Adwords_ad_groups",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        if InputIsAvailable("oauth-googleads") then
        {
          source: "in.c-keboola-ex-google-ads-" + ConfigId("keboola-marketingchannels-googleads-data-source") + ".report-url_adwords",
          destination: "Google_Adwords_url_adwords",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        if InputIsAvailable("ex-linkedin-start-day") then
        {
          source: "in.c-leochan-ex-linkedin-" + ConfigId("keboola-marketingchannels-linkedin-data-source") + ".ads_basic_stats",
          destination: "linkedinraw_ads_basic_stats",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        if InputIsAvailable("ex-linkedin-start-day") then
        {
          source: "in.c-leochan-ex-linkedin-" + ConfigId("keboola-marketingchannels-linkedin-data-source") + ".ads_cost",
          destination: "linkedinraw_ads_cost",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        if InputIsAvailable("ex-linkedin-start-day") then
        {
          source: "in.c-leochan-ex-linkedin-" + ConfigId("keboola-marketingchannels-linkedin-data-source") + ".campaigns",
          destination: "linkedinraw_campaigns",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
      ],)
    },
    output: {
      tables: std.filter(function(v) v != null,[
        if InputIsAvailable("oauth-googleads") then
        {
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".adwords",
          source: "out_adwords",
          primary_key: [
            "adwords_id",
          ],
        },
        if InputIsAvailable("ex-bingads-account-id") then
        {
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".out_bingads",
          source: "out_bingads",
          primary_key: [
            "bing_id",
          ],
        },
        if InputIsAvailable("oauth-facebookads") then
        {
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".out_facebook",
          source: "out_facebook",
          primary_key: [
            "facebook_ads_id",
          ],
        },
        if InputIsAvailable("ex-linkedin-start-day") then
        {
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".out_linkedin",
          source: "out_linkedin",
          primary_key: [
            "linkedin_id",
          ],
        },
        {
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".online_marketing",
          source: "out_marketing",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "online_marketing_traffic_id",
          ],
        },
        {
          destination: "out.c-marketing-tr-" + InstanceIdShort() + ".accounts",
          source: "accounts",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "ads_system",
            "account_id",
            "account_name",
          ],
        },
      ],)
    },
  },
}

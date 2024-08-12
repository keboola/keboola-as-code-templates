{
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-google-ads-" + ConfigId("google-campaigns-ads-spend-vs-budget-tracker") + ".campaign",
          destination: "google_campaign",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
          column_types: [
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: false,
              source: "customerId",
              destination: "customerId",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: false,
              source: "id",
              destination: "id",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "name",
              destination: "name",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "status",
              destination: "status",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "servingStatus",
              destination: "servingStatus",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "adServingOptimizationStatus",
              destination: "adServingOptimizationStatus",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "advertisingChannelType",
              destination: "advertisingChannelType",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "startDate",
              destination: "startDate",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "endDate",
              destination: "endDate",
            },
          ],
        },
        {
          source: "in.c-keboola-ex-google-ads-" + ConfigId("google-campaigns-ads-spend-vs-budget-tracker") + ".customer",
          destination: "google_customer",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
          column_types: [
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: false,
              source: "id",
              destination: "id",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "descriptiveName",
              destination: "descriptiveName",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "currencyCode",
              destination: "currencyCode",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "timeZone",
              destination: "timeZone",
            },
          ],
        },
        {
          source: "in.c-keboola-ex-google-ads-" + ConfigId("google-campaigns-ads-spend-vs-budget-tracker") + ".report-ad",
          destination: "google_ads",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
          column_types: [
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "adGroupAdAdId",
              destination: "adGroupAdAdId",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "adGroupAdAdName",
              destination: "adGroupAdAdName",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "campaignEndDate",
              destination: "campaignEndDate",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "campaignStartDate",
              destination: "campaignStartDate",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "segmentsDate",
              destination: "segmentsDate",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "adGroupAdAdGroup",
              destination: "adGroupAdAdGroup",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "adGroupId",
              destination: "adGroupId",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "adGroupName",
              destination: "adGroupName",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "campaignCampaignBudget",
              destination: "campaignCampaignBudget",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "campaignId",
              destination: "campaignId",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "campaignName",
              destination: "campaignName",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsAverageCost",
              destination: "metricsAverageCost",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsCostMicros",
              destination: "metricsCostMicros",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsAverageCpc",
              destination: "metricsAverageCpc",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsImpressions",
              destination: "metricsImpressions",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "campaignFrequencyCaps",
              destination: "campaignFrequencyCaps",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsAverageCpm",
              destination: "metricsAverageCpm",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsActiveViewCpm",
              destination: "metricsActiveViewCpm",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsAverageCpv",
              destination: "metricsAverageCpv",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsClicks",
              destination: "metricsClicks",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsCtr",
              destination: "metricsCtr",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsVideoViews",
              destination: "metricsVideoViews",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsVideoViewRate",
              destination: "metricsVideoViewRate",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "customerCurrencyCode",
              destination: "customerCurrencyCode",
            },
          ],
        },
        {
          source: "in.c-keboola-ex-google-ads-" + ConfigId("google-campaigns-ads-spend-vs-budget-tracker") + ".report-ad_group",
          destination: "google_ad_group",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
          column_types: [
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "adGroupId",
              destination: "adGroupId",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "adGroupName",
              destination: "adGroupName",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsCostMicros",
              destination: "metricsCostMicros",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsClicks",
              destination: "metricsClicks",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsImpressions",
              destination: "metricsImpressions",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsAverageCpm",
              destination: "metricsAverageCpm",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsCtr",
              destination: "metricsCtr",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsAverageCpc",
              destination: "metricsAverageCpc",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsActiveViewCpm",
              destination: "metricsActiveViewCpm",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsActiveViewCtr",
              destination: "metricsActiveViewCtr",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsActiveViewImpressions",
              destination: "metricsActiveViewImpressions",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsAverageCost",
              destination: "metricsAverageCost",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsAverageCpe",
              destination: "metricsAverageCpe",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsAverageCpv",
              destination: "metricsAverageCpv",
            },
          ],
        },
        {
          source: "in.c-keboola-ex-google-ads-" + ConfigId("google-campaigns-ads-spend-vs-budget-tracker") + ".report-campaign",
          destination: "google_campaign_report",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
          column_types: [
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "campaignId",
              destination: "campaignId",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "campaignName",
              destination: "campaignName",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "campaignStatus",
              destination: "campaignStatus",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsCostMicros",
              destination: "metricsCostMicros",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsClicks",
              destination: "metricsClicks",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsImpressions",
              destination: "metricsImpressions",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsAverageCpm",
              destination: "metricsAverageCpm",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsCtr",
              destination: "metricsCtr",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsAverageCpc",
              destination: "metricsAverageCpc",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsActiveViewCpm",
              destination: "metricsActiveViewCpm",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsActiveViewCtr",
              destination: "metricsActiveViewCtr",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsActiveViewImpressions",
              destination: "metricsActiveViewImpressions",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsAverageCost",
              destination: "metricsAverageCost",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsAverageCpe",
              destination: "metricsAverageCpe",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "metricsAverageCpv",
              destination: "metricsAverageCpv",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "campaignFrequencyCaps",
              destination: "campaignFrequencyCaps",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "campaignTargetCpmTargetFrequencyGoalTargetCount",
              destination: "campaignTargetCpmTargetFrequencyGoalTargetCount",
            },
          ],
        },
        {
          source: "in.c-keboola-ex-currency-" + ConfigId("ecb-currency-rates-ads-spend-vs-budget-tracker") + ".rates",
          destination: "currency_rates",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
          column_types: [
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "id",
              destination: "id",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "date",
              destination: "date",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "fromCurrency",
              destination: "fromCurrency",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "toCurrency",
              destination: "toCurrency",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "rate",
              destination: "rate",
            },
            {
              type: "STRING",
              length: "255",
              nullable: true,
              convert_empty_values_to_null: true,
              source: "source",
              destination: "source",
            },
          ],
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-Marketing_cash_flow.ads_insight_fact",
          source: "ads_insight_fact",
          primary_key: [
            "src_id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
      ],
    },
  },
  parameters: {},
}
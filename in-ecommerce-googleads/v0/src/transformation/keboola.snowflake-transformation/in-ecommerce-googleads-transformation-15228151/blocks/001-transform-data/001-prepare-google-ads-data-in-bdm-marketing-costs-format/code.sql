--GoogleAds campaigns source data
CREATE TABLE "bdm_marketing_campaign_costs"
AS
    SELECT
        "segmentsDate" || '-' || 'GoogleAds' || '-' || "campaignName" "MARKETING_CAMPAIGN_COSTS_ID"
      , 'GoogleAds'                                      							"SOURCE"
      , "segmentsDate"                                            		"DATE"
      , "campaignName"                                       					"CAMPAIGN"
      , SUM("metricsImpressions")                               			"IMPRESSIONS"
      , SUM("metricsClicks")                                    			"CLICKS"
      , SUM("metricsCostMicros") / 1000000                            "COST"
    FROM "report-campaign"
    GROUP BY 1, 2, 3, 4;

--GoogleAds campaigns source data grouped by month
CREATE TABLE "bdm_marketing_campaign_costs_monthly"
AS
    SELECT
        LEFT("segmentsDate", 7) || '-01-' || 'GoogleAds' || '-' || "campaignName" "MARKETING_CAMPAIGN_COSTS_ID"
      , 'GoogleAds'                                                  							"SOURCE"
      , LEFT("segmentsDate", 7) || '-01'                                      		"DATE"
      , "campaignName"                                                   					"CAMPAIGN"
      , SUM("metricsImpressions")                                           			"IMPRESSIONS"
      , SUM("metricsClicks")                                                			"CLICKS"
      , SUM("metricsCostMicros") / 1000000                                        "COST"
    FROM "report-campaign"
    GROUP BY 1, 2, 3, 4;

--facebook ads source data
CREATE TABLE "bdm_marketing_campaign_costs"
AS
    SELECT
        "date_start" || '-' || 'FacebookAds' || '-' || "ad_name" "MARKETING_CAMPAIGN_COSTS_ID"
      , 'Facebook'                                               "SOURCE"
      , "date_start"                                             "DATE"
      , "ad_name"                                                "CAMPAIGN"
      , SUM("impressions")                                       "IMPRESSIONS"
      , SUM("clicks")                                            "CLICKS"
      , SUM("spend")                                             "COST"
    FROM "facebook_ads_insights_last_90d_insights"
    GROUP BY 1, 2, 3, 4;

--facebook ads source data grouped by month
CREATE TABLE "bdm_marketing_campaign_costs_monthly"
AS
    SELECT
        "date_start" || '-' || 'FacebookAds' || '-' || "ad_name" "MARKETING_CAMPAIGN_COSTS_ID"
      , 'Facebook'                                               "SOURCE"
      , "date_start"                                             "DATE"
      , "ad_name"                                                "CAMPAIGN"
      , SUM("impressions")                                       "IMPRESSIONS"
      , SUM("clicks")                                            "CLICKS"
      , SUM("spend")                                             "COST"
    FROM "facebook_ads_insights_monthly_insights"
    GROUP BY 1, 2, 3, 4;

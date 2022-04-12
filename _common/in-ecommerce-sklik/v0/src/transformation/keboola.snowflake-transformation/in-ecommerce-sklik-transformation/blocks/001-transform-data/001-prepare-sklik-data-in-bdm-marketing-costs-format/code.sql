--sklik campaigns source data
CREATE TABLE "bdm_marketing_campaign_costs"
AS
    SELECT
            LEFT("st"."date", 4) || '-' || RIGHT(LEFT("st"."date", 6), 2) || '-' || RIGHT(LEFT("st"."date", 8), 2) ||
            '-' || 'Sklik' || '-' || "c"."name" "MARKETING_CAMPAIGN_COSTS_ID"
      ,     'Sklik'                             "SOURCE"
      ,     LEFT("st"."date", 4) || '-' || RIGHT(LEFT("st"."date", 6), 2) || '-' ||
            RIGHT(LEFT("st"."date", 8), 2)      "DATE"
      ,     "c"."name"                          "CAMPAIGN"
      ,     SUM("st"."impressions")             "IMPRESSIONS"
      ,     SUM("st"."clicks")                  "CLICKS"
      ,     SUM("st"."totalMoney") / 100        "COST"
    FROM "sklik-campaigns-stats" "st"
             LEFT JOIN "sklik-campaigns" "c"
                       ON "st"."id" = "c"."id"
    WHERE "st"."date" <> ''
    GROUP BY 1, 2, 3, 4;

--sklik campaigns source data grouped by month
CREATE TABLE "bdm_marketing_campaign_costs_monthly"
AS
    SELECT
            LEFT("st"."date", 4) || '-' || RIGHT(LEFT("st"."date", 6), 2) || '-01' ||
            '-' || 'Sklik' || '-' || "c"."name"                                    "MARKETING_CAMPAIGN_COSTS_ID"
      ,     'Sklik'                                                                "SOURCE"
      ,     LEFT("st"."date", 4) || '-' || RIGHT(LEFT("st"."date", 6), 2) || '-01' "DATE"
      ,     "c"."name"                                                             "CAMPAIGN"
      ,     SUM("st"."impressions")                                                "IMPRESSIONS"
      ,     SUM("st"."clicks")                                                     "CLICKS"
      ,     SUM("st"."totalMoney") / 100                                           "COST"
    FROM "sklik-campaigns-monthly-stats" "st"
             LEFT JOIN "sklik-campaigns-monthly" "c"
                       ON "st"."id" = "c"."id"
    WHERE "st"."date" <> ''
    GROUP BY 1, 2, 3, 4;

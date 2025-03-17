CREATE OR REPLACE TABLE campaign_groups AS (
    SELECT
        "id",
        TO_TIMESTAMP("changeAuditStamps_created_time"/1000)::DATE as created_date,
        TO_TIMESTAMP("changeAuditStamps_lastModified_time"/1000)::DATE as modified_date,
        TO_TIMESTAMP("runSchedule_start"/1000)::DATE as start_date,
        "name",
        "account",
        CASE 
            WHEN "runSchedule_end" LIKE '' THEN NULL 
                ELSE TO_TIMESTAMP("runSchedule_end" / 1000)::DATE 
            END  as end_date,
        "status"
    FROM "linkedin_campaign_groups"
    --WHERE created_date > '2023-01-01'
);

CREATE OR REPLACE TABLE campaign_linkedin as (
    SELECT 
        "id" as "camp_id",
        TO_TIMESTAMP("created"/1000)::DATE as created_date,
        "audienceExpansionEnabled",
        "associatedEntity",
        TO_TIMESTAMP("lastModified"/1000)::DATE as lastModified,
        "name",
        "language",
        "account",
        "servingStatuses",
        TO_NUMBER(REGEXP_SUBSTR("campaignGroup", 'urn:li:sponsoredCampaignGroup:(\\d+)', 1, 1, 'e')) AS campaignGroupId, --
        "status",
        "objectiveType",
        "unitCost_amount",
        TO_TIMESTAMP("runSchedule"/1000)::DATE as runSchedule,
        "unitCost_currencyCode" as currency
    FROM "linkedin_campaigns"
);

CREATE OR REPLACE TABLE ads_stats_linkedin as (
    SELECT 
        TO_DATE("start_year" || '-' || "start_month" || '-' || "start_day") AS start_date,
        TO_DATE("end_year" || '-' || "end_month" || '-' || "end_day") AS end_date, 
        "impressions",
        "clicks",
        TO_NUMBER(REGEXP_SUBSTR("pivotValue", 'urn:li:sponsoredCampaign:(\\d+)', 1, 1, 'e')) AS campaignId,
        
        --"pivotValue" as "campaignGroup", 
        "totalEngagements",
        "landingPageClicks",
        "shares",
        "comments",
        "companyPageClicks",
        "likes",
        "commentLikes"
    FROM "linkedin_ads_basic_stats"
);

CREATE OR REPLACE TABLE ads_cost_linkedin AS (
    SELECT 
        TO_DATE("start_year" || '-' || "start_month" || '-' || "start_day") AS start_date,
        TO_DATE("end_year" || '-' || "end_month" || '-' || "end_day") AS end_date, 
        "costInLocalCurrency",
         TO_NUMBER(REGEXP_SUBSTR("pivotValue", 'urn:li:sponsoredCampaign:(\\d+)', 1, 1, 'e')) AS campaignId,
        --"pivotValue" as "campaignGroup",
        "costInUsd"
    FROM "linkedin_ads_cost"
);

SELECT * FROM "linkedin_campaigns";

-- Creation of campaigns table 

CREATE OR REPLACE TABLE campaigns AS (
SELECT 
    cg."id", 
    cg.CREATED_DATE,
    cg.MODIFIED_DATE,
    cg.START_DATE,
    cg."name",
    TO_NUMBER(REGEXP_SUBSTR(cg."account", 'urn:li:sponsoredAccount:(\\d+)', 1, 1, 'e')) AS "accoun_id",
    cg.END_DATE,
    cl."status",
    cl."camp_id",
    TO_NUMBER(REGEXP_SUBSTR(cl."associatedEntity", 'urn:li:organization:(\\d+)', 1, 1, 'e')) AS "entity_id",
    cl."language",
    cl."unitCost_amount",
    cl.CURRENCY
FROM campaign_groups cg 
     LEFT JOIN campaign_linkedin cl on cg."id" = cl.CAMPAIGNGROUPID
    
);

----All ads and their cost table 

CREATE OR REPLACE TABLE ADS AS (
select 
s.CAMPAIGNID, 
s.start_date,
s.END_DATE,
s."impressions",
s."clicks",
s."totalEngagements",
s."landingPageClicks",
s."shares",
s."comments",
s."companyPageClicks",
s."likes",
s."commentLikes",
c."costInLocalCurrency",
c."costInUsd"
from ads_stats_linkedin s
LEFT JOIN ads_cost_linkedin c on s.CAMPAIGNID = c.CAMPAIGNID AND s.start_date = c.start_date and s.end_date = c.end_date
);

-- Joining both tables 

CREATE OR REPLACE TABLE linkedin_table as (
SELECT
    c."id" as "ads_id" ,
    c."camp_id" as "campaing_id",
    c."entity_id",
    c."name" as "campaing_name",
    c.CREATED_DATE,
    a.START_DATE,
    c.MODIFIED_DATE,
    a.END_DATE,
    c."accoun_id",
    c."status",
    "language",
    "unitCost_amount",
    CURRENCY,
    "impressions",
    "clicks",
    "totalEngagements",
    "landingPageClicks",
    "shares",
    "comments",
    "companyPageClicks",
    "likes",
    "commentLikes",
    ROUND("costInLocalCurrency",3) as "costInLocalCurrency",
    ROUND("costInUsd",3) as "costInUsd"
FROM campaigns c 
JOIN ads a on c."camp_id" = a.CAMPAIGNID
);

CREATE OR REPLACE TABLE "linkedin"(
   "src_id" varchar (100),
  "user_id" varchar (100) ,
  "account_id" varchar (100), 
  "platform_id" varchar(100),
  "account_name" varchar (100),
  "ads_id" integer ,
  "ads_name" varchar (100) ,
  "created_date" date,
  "start_date" date,
  "modified_date" date,
  "end_date" date, 
  "campaign_id" integer,
  "campaign_name" varchar (100), 
  "currency_id" varchar (10), 
  "spent_amount" NUMBER(24,3), 
  "reach" NUMBER(24,0),
  "impressions" NUMBER(24,0), 
  "frequency" NUMBER(24,3),
  "cpm" NUMBER(24,3), 
  "cpv" NUMBER(24,3),
  "link_clicks" NUMBER(24,0),
  "ctr" NUMBER(24,3),
  "post_comments" NUMBER(24,0),
  "post_reactions" NUMBER(24,0),
  "post_shares" NUMBER(24,0),
  "video_views" NUMBER(24,0),
  "view_rate"  NUMBER(24,0),
  "six_sec_video_view" NUMBER(24,0), 
  "full_video_view" NUMBER(24,0),
  "est_ad_recall_lift" NUMBER(24,0),
  "est_ad_recall_lift_rate" NUMBER(24,3),
  "active_view_measurability" NUMBER(24,3),
  "landing_page_clicks" NUMBER(24,0),
  "paid_comments" NUMBER(24,0),
  "paid_likes" NUMBER(24,0), 
  "paid_shares" NUMBER(24,0)
 );

INSERT INTO "linkedin" 
(
   "src_id",
   "user_id",
  "account_id",
  "platform_id", 
  "account_name",
  "ads_id",
  "ads_name",
  "created_date",
  "start_date" , 
  "modified_date" , 
  "end_date" , 
  "campaign_id" , 
  "campaign_name" , 
  "currency_id" , 
  "spent_amount" ,
  "reach",
  "impressions", 
  "frequency",
  "cpm", 
  "link_clicks",
  "ctr",
  "cpv",
  "post_comments",
  "post_reactions",
  "post_shares",
  "video_views",
  "view_rate",
  "six_sec_video_view",
  "full_video_view",
  "est_ad_recall_lift",
  "est_ad_recall_lift_rate",
  "active_view_measurability",
  "landing_page_clicks",
  "paid_comments",
  "paid_likes", 
  "paid_shares" 
 )

SELECT
    concat ('LINKEDIN.', "ads_id", '.', START_DATE),
    NULL,
    "accoun_id",
    'LINKEDIN',
    "linkedin_accounts"."name",
    "ads_id",
    NULL, 
    CREATED_DATE,
    START_DATE,
    MODIFIED_DATE,
    END_DATE,
    "campaing_id",
    "campaing_name",
    "linkedin_accounts"."currency", 
    "costInLocalCurrency",
    NULL, -- PRIDAT DO EXTRAKTORU
    "impressions",
    NULL, -- Frequency is NULL as we don't have reach metric rn.
    ROUND("costInLocalCurrency",3)/"impressions"*1000 as "cpm",
    "clicks", 
    "clicks"/"impressions"*100 as "ctr",
    NULL,
    "comments", --?
    NULL, 
    "shares", --?
    NULL,
    NULL,
    NULL,--
    NULL,
    NULL,
    NULL,
    NULL,
    "landingPageClicks",
    NULL,
    "likes",
    NULL
    
FROM linkedin_table 
JOIN "linkedin_accounts" 
    ON linkedin_table."accoun_id" = "linkedin_accounts"."id"
;

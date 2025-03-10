CREATE OR REPLACE TABLE "meta"(
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

INSERT INTO "meta" 
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
    concat ('META.', AI."ad_id", '.', AI."date_start"),
    null,
    SUBSTRING(AI."ex_account_id", 5), --or parent_id?
    'META',
    ACC."name",
    AI."ad_id",
    AI."ad_name",
    null,
    AI."date_start",
    null,
    AI."date_stop",
    C."id",
    C."name",
    ACC."currency",
    CASE WHEN AI."spend" = '' THEN 0 ELSE CAST(AI."spend" AS NUMERIC(24, 3)) END,
    CASE WHEN AI."reach" = '' THEN 0 ELSE CAST(AI."reach" AS NUMERIC(24, 0)) END,
    CASE WHEN AI."impressions" = '' THEN 0 ELSE CAST(AI."impressions" AS NUMERIC(24, 0)) END,
    NULL, --frequency
    CASE WHEN AI."spend" = '' OR AI."impressions" = '' THEN 0 ELSE CAST(AI."spend" AS NUMERIC(24, 3)) / CAST(AI."impressions" AS NUMERIC(24, 0)) * 1000 END AS CPM,
    CASE WHEN AI."clicks" = '' THEN 0 ELSE CAST(AI."clicks" AS NUMERIC(24, 0)) END,
    CASE WHEN AI."impressions" = '' THEN 0 ELSE CAST(AI."clicks" AS NUMERIC(24, 0)) / CAST(AI."impressions" AS NUMERIC(24, 0)) * 100 END AS CTR,
    NULL,
    AT.post_comment, --post_comments
    AT.post_reaction, --post_reactions,
    NULL, --post_shares,
    AT.video_view, --video_views,
    NULL,
    NULL, --six_sec_video_view,
    NULL, --full_video_view,
    NULL, --est_ad_recall_lift,
    CASE WHEN AI."estimated_ad_recall_rate" = '' THEN 0 ELSE CAST(AI."estimated_ad_recall_rate" AS NUMERIC(24, 3)) END,
    NULL, --active_view_measurability,
    AT.landing_page_view, --landing_page_clicks,
    NULL, --paid_comments,
    NULL, --paid_likes, 
    NULL --paid_shares 
FROM "facebook_ads_insights" AI
LEFT JOIN "facebook_accounts" ACC
    ON SUBSTRING(AI."ex_account_id", 5) = ACC."account_id"
LEFT JOIN "facebook_ads" A --to extract adset_id
    ON AI."ad_id" = A."id" 
LEFT JOIN "facebook_adsets" ADS -- to extract campaign_id
    ON A."adset_id" = ADS."id"
LEFT JOIN "facebook_campaigns" C
    ON ADS."campaign_id" = C."id"
LEFT JOIN (select 
            "account_id","campaign_id" ,"date_start",
            sum(case when "action_type"= 'post_engagement'   then "value" else 0 end) post_engagement,
            sum(case when "action_type"= 'video_view'        then "value" else 0 end) video_view,
            sum(case when "action_type"= 'post_reaction'     then "value" else 0 end) post_reaction,
            sum(case when "action_type"= 'photo_view'        then "value" else 0 end) photo_view,
            sum(case when "action_type"= 'link_click'        then "value" else 0 end) link_click,
            sum(case when "action_type"= 'comment'           then "value" else 0 end) post_comment,
            sum(case when "action_type"= 'page_engagement'   then "value" else 0 end) page_engagement,
            sum(case when "action_type"= 'post'              then "value" else 0 end) post,
            sum(case when "action_type"= 'landing_page_view' then "value" else 0 end) landing_page_view
            --select distinct "action_type"
            from "facebook_campaigns_insights_type_insights"    
            --where  "date_start"=date'2023-07-31' and "campaign_id"='23857433867210537'
            group by "account_id","campaign_id" ,"date_start"
          ) AT on AT."account_id"  = ACC."account_id" 
              and AT."campaign_id" = ADS."campaign_id"
              and AT."date_start"  = AI."date_start"
 
;

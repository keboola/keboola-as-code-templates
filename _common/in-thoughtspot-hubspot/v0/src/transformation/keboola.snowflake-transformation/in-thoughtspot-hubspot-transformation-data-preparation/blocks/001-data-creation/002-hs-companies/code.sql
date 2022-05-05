-- HS_HUBSPOT."PUBLIC".HS_COMPANIES
CREATE TABLE HS_COMPANIES AS
SELECT DISTINCT
"companyId" AS ID,
"created_at" AS CREATED_AT,
"isDeleted" AS ARCHIVED,
"country" AS COUNTRY,
"city" AS CITY,
"createdate" AS CREATEDATE,
"industry" AS INDUSTRY,
to_number(NULLIF("numberofemployees",'')) AS NUMBEROFEMPLOYEES,
"hs_analytics_source" AS HS_ANALYTICS_SOURCE, 
"state" AS STATE,
"zip" AS ZIP,
"hs_num_open_deals" AS HS_NUM_OPEN_DEALS,
"website" AS WEBSITE,
"name" AS NAME,
"total_revenue" AS TOTAL_REVENUE, 
"hs_is_target_account" AS HS_IS_TARGET_ACCOUNT, 
"updated_at" AS UPDATED_AT,
"hs_analytics_last_visit_timestamp" AS HS_ANALYTICS_LAST_VISIT_TIMESTAMP,
"hs_analytics_num_visits"  AS HS_ANALYTICS_NUM_VISITS,
"lifecyclestage" AS LIFECYCLESTAGE
FROM "companies";

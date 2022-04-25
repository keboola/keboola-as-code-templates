-- HS_HUBSPOT."PUBLIC".HS_DEALS 
CREATE TABLE HS_DEALS 
AS
SELECT DISTINCT
    "dealId" AS ID,
    "dealname" AS DEALNAME,
    "hs_forecast_amount" AS HS_FORECAST_AMOUNT,
    "createdate" AS CREATEDATE,
    "hs_is_closed" AS HS_IS_CLOSED,
    "hs_deal_stage_probability" AS HS_DEAL_STAGE_PROBABILITY,
    "days_to_close" AS DAYS_TO_CLOSE,
    "hs_created_by_user_id" AS HS_CREATED_BY_USER_ID,
    "hs_projected_amount" AS HS_PROJECTED_AMOUNT,
    "hs_is_closed_won" AS HS_IS_CLOSED_WON,
    "dealstage" AS DEALSTAGE,
    "hs_closed_amount_in_home_currency" AS HS_CLOSED_AMOUNT_IN_HOME_CURRENCY,
    "description" AS DESCRIPTION,
    "amount_in_home_currency" AS AMOUNT_IN_HOME_CURRENCY,
    "hs_closed_amount" AS HS_CLOSED_AMOUNT,
    "dealtype" AS DEALTYPE,
    "amount" AS AMOUNT,
    "closedate" AS CLOSEDATE,
    "pipeline" AS PIPELINE,
    "hs_lastmodifieddate" AS HS_LASTMODIFIEDDATE,
    "hs_date_entered_closedwon" AS HS_DATE_ENTERED_CLOSEDWON
FROM "deals"
;

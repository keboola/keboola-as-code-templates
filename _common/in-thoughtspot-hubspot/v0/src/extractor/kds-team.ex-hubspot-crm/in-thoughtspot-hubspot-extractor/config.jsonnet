{ storage: {
    output: {
      default_bucket: "in.c-kds-team-ex-hubspot-crm-" + ConfigId("in-thoughtspot-hubspot-extractor")
    }
  },
  parameters: 
  {
    authentication_type: "Private App Token",
    include_contact_list_membership: true,
    property_attributes: {
      include_source: 0,
      include_versions: 0,
      include_timestamp: 0,
    },
    incremental_output: 1,
    download_contact_associations: true,
    deal_properties: "authority, budget, campaign_source, hs_analytics_source, hs_campaign, hs_lastmodifieddate, need, timeframe, dealname, amount, closedate, pipeline, createdate, engagements_last_meeting_booked, dealtype, hs_createdate, description, start_date, closed_lost_reason, closed_won_reason, end_date, lead_owner, tech_owner, service_amount, contract_type, hubspot_owner_id, partner_name, notes_last_updated, id, hs_forecast_amount, hs_is_closed, hs_deal_stage_probability, days_to_close, hs_created_by_user_id, hs_projected_amount, hs_is_closed_won, hs_closed_amount_in_home_currency, description, amount_in_home_currency, hs_closed_amount, closedate, hs_date_entered_closedwon",
    period_from: Input("ex-hubspot-crm-period-from"),
    "#private_app_token": Input("ex-hubspot-crm-private-app-token"),
    contact_properties: "hs_facebookid, hs_linkedinid, ip_city, ip_country, ip_country_code, newsletter_opt_in, firstname, linkedin_profile, lastname, email, mobilephone, phone, city, country, region, jobtitle, company, website, numemployees, industry, associatedcompanyid, hs_lead_status, lastmodifieddate, source, hs_email_optout, twitterhandle, lead_type, hubspot_owner_id, notes_last_updated, hs_analytics_source, opt_in, createdate, hs_twitterid, lifecyclestage, id,  archived, hs_time_to_first_engagement, hs_last_sales_activity_date, hs_email_last_send_date, hs_count_is_worked, hs_sa_first_engagement_date, hs_sa_first_engagement_object_type, hs_is_unworked, hs_analytics_num_visits, hs_social_linkedin_clicks, hs_social_google_plus_clicks, hs_social_facebook_clicks, hs_social_twitter_clicks, hs_email_sends_since_last_engagement, hs_count_is_unworked, state, hs_email_last_open_date, zip, hs_email_last_click_date, hs_email_first_click_date, hs_sequences_enrolled_count, hs_sequences_is_enrolled, hs_sequences_actively_enrolled_count, hs_latest_sequence_ended_date, seniority, first_deal_created_date, num_associated_deals, hs_time_between_contact_creation_and_deal_creation, days_to_close, hs_time_between_contact_creation_and_deal_close, closedate, total_revenue, hs_email_last_reply_date, first_conversion_event_name, first_conversion_date, currentlyinworkflow, hs_analytics_first_url, hs_analytics_last_url, hs_analytics_first_referrer, hs_analytics_last_referrer, submitter_at, engagement_id, company_id, form_id, next_contact_date, hs_lifecyclestage_opportunity_date, hs_lifecyclestage_marketingqualifiedlead_date, hs_lifecyclestage_customer_date, hs_lifecyclestage_salesqualifiedlead_date, hs_lifecyclestage_evangelist_date",
    call_properties: "id, created_at, created_by, label, body, title, disposition, engagement_id",
    company_properties: "about_us, name, phone, facebook_company_page, city, country, website, industry, annualrevenue, linkedin_company_page, hs_lastmodifieddate, hubspot_owner_id, notes_last_updated, description, createdate, numberofemployees, hs_lead_status, founded_year, twitterhandle, linkedinbio, id, numberofemployees, hs_num_open_deals, state, total_revenue, created_at, archived, hs_analytics_source, zip, hs_is_target_account, updated_at, hs_analytics_last_visit_timestamp, hs_analytics_num_visits, lifecyclestage",
    email_properties: "id, created_at, created_by, app_id,app_name, created, email_campaign_id, id, portal_id, recipient, type, sent_by_created, sent_by_id, browser_name, location_city, location_country, location_state, user_agent, duration, source, portal_subscription_status, attempt, response,url, subject, from, drop_message, caused_by_id, html, from_email, sender_email, text, status, from_first_name, from_last_name, engagement_id",
    meeting_properties: "id, created_at, created_by, start_time, end_time, title, body, meeting_outcome, location, engagement_id, external_url",
    endpoints: [
      "companies",
      "activities",
      "lists",
      "owners",
      "contacts",
      "deals",
      "pipelines",
      "calls",
      "emails",
      "marketing_email_statistics",
      "meetings",
      "forms",
      "email_events",
      "email_events-SENT",
      "email_events-DROPPED",
      "email_events-PROCESSED",
      "email_events-DELIVERED",
      "email_events-DEFERRED",
      "email_events-BOUNCE",
      "email_events-OPEN",
      "email_events-CLICK",
    ],
  },
}

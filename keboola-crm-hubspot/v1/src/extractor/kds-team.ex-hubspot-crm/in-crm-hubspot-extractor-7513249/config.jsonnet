{
  parameters: {
    include_contact_list_membership: true,
    property_attributes: {
      include_source: 0,
      include_versions: 0,
      include_timestamp: 0,
    },
    incremental_output: 1,
    deal_properties: "authority, budget, campaign_source, hs_analytics_source, hs_campaign, hs_lastmodifieddate, need, timeframe, dealname, amount, closedate, pipeline, createdate, engagements_last_meeting_booked, dealtype, hs_createdate, description, start_date, closed_lost_reason, closed_won_reason, end_date, lead_owner, tech_owner, service_amount, contract_type, hubspot_owner_id, partner_name, notes_last_updated",
    period_from: Input("ex-hubspot-crm-period-from"),
    "#api_token": Input("ex-hubspot-crm-api-token"),
    contact_properties: "hs_facebookid, hs_linkedinid, ip_city, ip_country, ip_country_code, newsletter_opt_in, firstname, linkedin_profile, lastname, email, mobilephone, phone, city, country, region, jobtitle, company, website, numemployees, industry, associatedcompanyid, hs_lead_status, lastmodifieddate, source, hs_email_optout, twitterhandle, lead_type, hubspot_owner_id, notes_last_updated, hs_analytics_source, opt_in, createdate, hs_twitterid, lifecyclestage",
    call_properties: "",
    company_properties: "about_us, name, phone, facebook_company_page, city, country, website, industry, annualrevenue, linkedin_company_page, hs_lastmodifieddate, hubspot_owner_id, notes_last_updated, description, createdate, numberofemployees, hs_lead_status, founded_year, twitterhandle, linkedinbio",
    email_properties: "",
    download_contact_associations: true,
    meeting_properties: "",
    endpoints: [
      "companies",
      "activities",
      "lists",
      "owners",
      "contacts",
      "deals",
      "pipelines",
    ],
  },
}

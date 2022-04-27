{
  name: "[OUT-CRM-GSHEET] Writer /"+ if std.length(Input("ex-hubspot-crm-api-token")) > 0 then ConfigId("in-crm-hubspot-extractor-7513249") else if std.length(Input("ex-salesforce-v2-username")) > 0 then ConfigId("in-crm-salesforce-extractor-12706099"),
}

{
  parameters: {},
  storage: {
    input: {
      tables:
      [
        {
          source: "in.c-kds-team-app-generative-ai-" + ConfigId("generative-ai-personalise-sms-campaign") + ".twilio_sms_campaign_source_data",
          destination: "twilio_sms_campaign_source_data",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "out.c-campaign-executer-" + InstanceIdShort() + ".twilio_sms_campaign_ready",
          source: "out_twilio_sms_campaign_ready",
        },
        {
          destination: "out.c-campaign-executer-" + InstanceIdShort() + ".twilio_sms_campaign_approval_request",
          source: "out_twilio_sms_campaign_approval_request",
        },
      ],
    },
  },
}

{
  parameters: {},
  storage: {
    input: {
      tables:
      [
        {
          source: "in.c-kds-team-app-generative-ai-" + ConfigId("generative-ai-personalise-sms-campaign") + ".twilio_sms_campaing_source_data",
          destination: "twilio_sms_campaing_source_data",
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
          destination: "out.c-campaign-executer-" + InstanceIdShort() + ".twilio-sms-campaign-ready",
          source: "out-twilio-sms-campaign-ready",
        },
        {
          destination: "out.c-campaign-executer-" + InstanceIdShort() + ".twilio-sms-campaign-approval-request",
          source: "out-twilio-sms-campaign-approval-request",
        },
      ],
    },
  },
}

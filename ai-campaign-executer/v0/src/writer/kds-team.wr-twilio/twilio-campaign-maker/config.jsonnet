{
  parameters: {
    output_log: true,
    "#auth_token": Input("wr-twilio-auth-token"),
    account_sid: Input("wr-twilio-account-sid"),
    messaging_service_sid: Input("wr-twilio-messaging-service-sid"),
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-campaign-executer-" + InstanceIdShort() + ".sms_campaign",
          destination: "sms_campaign.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
      ],
    },
  },
}

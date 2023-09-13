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
          source: "out.c-campaign-executer-" + InstanceIdShort() + ".twilio-sms-campaign-approval-request",
          destination: "twilio-sms-campaign-approval-request.csv",
          where_column: "approved",
          where_values: [],
          where_operator: "eq",
          columns: [
            "phone_number",
            "message"
          ],
          keep_internal_timestamp_column: false,
        },
      ],
    },
  },
}

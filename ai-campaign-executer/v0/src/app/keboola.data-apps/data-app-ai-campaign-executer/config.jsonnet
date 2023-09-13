{
  parameters: {
    dataApp: {
      git: {
        repository: "https://github.com/keboola/ai_campaign_executer",
        branch: "main",
        entrypoint: "campaign_executor.py",
      },
      secrets: {
        "#kbc_storage_token": Input("kbc_storage_token"),
      },
    },
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-campaign-executer-" + InstanceIdShort() + ".twilio-sms-campaign-approval-request",
          destination: "twilio-sms-campaign-approval-request.csv",
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
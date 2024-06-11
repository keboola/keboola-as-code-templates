{
  parameters: {
    dataApp: {
      streamlitAuthEnabled: true,
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
          source: "out.c-campaign-executer.twilio_sms_campaign_approval_request",
          destination: "twilio_sms_campaign_approval_request.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
      ],
    },
  },
  authorization: {
    app_proxy: {
      auth_providers: [],
      auth_rules: [
        {
          type: "pathPrefix",
          value: "/",
          auth_required: false
        }
      ]
    }
  }
}

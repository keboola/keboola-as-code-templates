{
  parameters: {
    dataApp: {
      git: {
        repository: "https:TBD",
        branch: "main",
        entrypoint: "TBD.py",
      },
      secrets: {
        KEBOOLA_STACK: Input("kbc_stack"),
        "#KEBOOLA_STORAGE_TOKEN": Input("kbc_storage_token"),
      },
    },
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

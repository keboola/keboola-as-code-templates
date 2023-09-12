{
  parameters: {
    model: "gpt-3.5-turbo",
    destination: {
      incremental_load: false,
      output_table_name: "",
      primary_keys_array: [
        "customer_id",
        "phone",
      ],
    },
    prompt_options: {
      prompt: 'create short description for sms campaign for customer Peter with unformally addressed to the customer for\nproduct: """[[title]]"""\nwith description: """[[body_html]]"""\nlimit 300 characters add emoji and add to the end that this add was powered with Keboola AI',
    },
    max_token_spend: 0,
    prompt_templates: {
      prompt_template: "timestamp_from_date",
    },
    additional_options: {
      top_p: 1,
      max_tokens: 100,
      temperature: 0.6,
      request_timeout: 30,
      presence_penalty: 0,
      frequency_penalty: 0,
    },
  },
  storage: {
    input: {
      tables: [
        {
          source: "out.c-campaign-executer-" + InstanceIdShort() + ".sms_campaign",
          destination: "sms_campaign.csv",
          where_column: "customer_id",
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
      ],
    },
  },
}

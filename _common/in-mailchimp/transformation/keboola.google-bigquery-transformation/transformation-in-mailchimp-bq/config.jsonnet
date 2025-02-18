{
  parameters: {},
  storage: {
    output: {
      data_type_support: "authoritative",
      tables: [
        {
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".campaign",
          source: "campaign_out",
          primary_key: [
            "campaign_id",
          ],
        },
        {
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".customer",
          source: "customer_out",
          primary_key: [
            "customer_id",
          ],
        },
        {
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".campaign_event",
          source: "campaign_event_out",
          primary_key: [
            "campaign_event_id",
          ],
        },
        {
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".list",
          source: "lists_out",
          primary_key: [
            "list_id",
          ],
        },
        {
          destination: "out.c-mailchimp-bdm-" + InstanceIdShort() + ".list_member",
          source: "list_member_out",
          primary_key: [
            "list_member_id",
          ],
        },
      ],
    },
    input: {
      tables: [
        {
          source: "in.c-mailchimp-ex-" + ConfigId("data-source-1-in-mailchimp") + ".campaigns",
          destination: "campaigns",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-mailchimp-ex-" + ConfigId("data-source-2-in-mailchimp") + ".members",
          destination: "members",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-mailchimp-ex-" + ConfigId("data-source-2-in-mailchimp") + ".lists",
          destination: "lists",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
  },
}

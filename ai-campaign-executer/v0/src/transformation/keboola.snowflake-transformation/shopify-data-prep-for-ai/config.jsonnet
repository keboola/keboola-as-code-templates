{
  parameters: {},
  storage: {
    input: {
      tables:
      [
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("shopify-data-source") + ".customer",
          destination: "customer",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("shopify-data-source") + ".line_item",
          destination: "line-item",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("shopify-data-source") + ".order",
          destination: "order",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
         {
          source: "in.c-kds-team-ex-shopify-" + ConfigId("shopify-data-source") + ".product",
          destination: "product",
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
          destination: "out.campaign-executer-" + InstanceIdShort() + ".sms_campaign",
          source: "out_sms_campaign",
        },
      ],
    },
  },
}

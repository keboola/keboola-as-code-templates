{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-crm-tr-" + InstanceIdShort() + ".activities",
          destination: "activities",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-wr-" + InstanceIdShort() + ".opportunity",
          destination: "opportunity",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-wr-" + InstanceIdShort() + ".contact",
          destination: "contact",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-wr-" + InstanceIdShort() + ".employee",
          destination: "employee",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-wr-" + InstanceIdShort() + ".contact",
          destination: "contact_ri",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-wr-" + InstanceIdShort() + ".opportunity",
          destination: "opportunity_ri",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-crm-tr-" + InstanceIdShort() + ".deals",
          destination: "deals",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + InstanceIdShort() + ".opportunity_snapshot",
          destination: "opportunity_snapshot",
          column_types: [],
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
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".activity",
          source: "out_activity",
          primary_key: [
            "activity_id",
          ],
        },
        {
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".opportunity_contact",
          source: "out_opportunity_contact",
          primary_key: [
            "opportunity_contact_id",
          ],
        },
        {
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".opportunity_snapshot",
          source: "out_opportunity_snapshot",
          primary_key: [
            "opportunity_id",
            "snapshot_date",
          ],
        },
      ],
    },
  },
}

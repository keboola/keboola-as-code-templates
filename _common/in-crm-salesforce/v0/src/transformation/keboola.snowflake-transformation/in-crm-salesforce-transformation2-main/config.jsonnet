{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-tr-" + InstanceIdShort() + ".account",
          destination: "account",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + InstanceIdShort() + ".contact",
          destination: "contact",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + InstanceIdShort() + ".event",
          destination: "event",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + InstanceIdShort() + ".lead",
          destination: "lead",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + InstanceIdShort() + ".opportunity",
          destination: "opportunity",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + InstanceIdShort() + ".opportunity_contact_role",
          destination: "opportunity_contact_role",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + InstanceIdShort() + ".user",
          destination: "user",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + InstanceIdShort() + ".opportunity_stage",
          destination: "opportunity_stage",
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
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".company",
          source: "out_company",
          primary_key: [
            "company_id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".contact",
          source: "out_contact",
          primary_key: [
            "contact_id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".employee",
          source: "out_employee",
          primary_key: [
            "employee_id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".opportunity",
          source: "out_opportunity",
          primary_key: [
            "opportunity_id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-crm-tr-" + InstanceIdShort() + ".opportunity_snapshot",
          source: "out_opportunity_snapshot",
          primary_key: [
            "opportunity_id",
            "snapshot_date",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".activity",
          source: "out_activity",
          primary_key: [
            "activity_id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".opportunity_contact",
          source: "out_opportunity_contact",
          primary_key: [
            "opportunity_contact_id",
          ],
        },
      ],
    },
  }
}

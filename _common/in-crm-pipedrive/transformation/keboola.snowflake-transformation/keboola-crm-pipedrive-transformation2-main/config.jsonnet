{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-crm-tr" + InstanceIdShort() + ".organizations",
          destination: "organizations",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-crm-tr" + InstanceIdShort() + ".persons",
          destination: "persons",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-crm-tr" + InstanceIdShort() + ".person_emails",
          destination: "person_emails",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-crm-tr" + InstanceIdShort() + ".users",
          destination: "users",
          column_types: [],
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-crm-tr" + InstanceIdShort() + ".pipelines",
          destination: "pipelines",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-crm-tr" + InstanceIdShort() + ".stages",
          destination: "stages",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-crm-tr" + InstanceIdShort() + ".deals",
          destination: "deals",
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
          destination: "out.c-crm-wr" + InstanceIdShort() + ".company",
          source: "out_company",
          primary_key: [
            "company_id",
          ],
        },
        {
          destination: "out.c-crm-wr" + InstanceIdShort() + ".contact",
          source: "out_contact",
          primary_key: [
            "contact_id",
          ],
        },
        {
          destination: "out.c-crm-wr" + InstanceIdShort() + ".employee",
          source: "out_employee",
          primary_key: [
            "employee_id",
          ],
        },
        {
          destination: "out.c-crm-wr" + InstanceIdShort() + ".opportunity",
          source: "out_opportunity",
          primary_key: [
            "opportunity_id",
          ],
        },
        {
          destination: "out.c-crm-tr" + InstanceIdShort() + ".opportunity_snapshot",
          source: "out_opportunity_snapshot",
          primary_key: [
            "snapshot_date",
            "opportunity_id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
      ],
    },
  },
}

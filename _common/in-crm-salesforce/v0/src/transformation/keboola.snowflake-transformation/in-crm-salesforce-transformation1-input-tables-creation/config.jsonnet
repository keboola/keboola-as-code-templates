{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor") + ".account",
          destination: "account",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor") + ".contact",
          destination: "contact",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor") + ".lead",
          destination: "lead",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor") + ".event",
          destination: "event",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor") + ".opportunity",
          destination: "opportunity",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor") + ".opportunitycontactrole",
          destination: "opportunitycontactrole",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor") + ".opportunitystage",
          destination: "opportunitystage",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor") + ".user",
          destination: "user",
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
          destination: "out.c-crm-tr-" + InstanceIdShort() + ".account",
          source: "out_account",
          primary_key: [
            "Id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-crm-tr-" + InstanceIdShort() + ".contact",
          source: "out_contact",
          primary_key: [
            "Id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-crm-tr-" + InstanceIdShort() + ".lead",
          source: "out_lead",
          primary_key: [
            "Id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-crm-tr-" + InstanceIdShort() + ".user",
          source: "out_user",
          primary_key: [
            "Id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-crm-tr-" + InstanceIdShort() + ".opportunity",
          source: "out_opportunity",
          primary_key: [
            "Id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-crm-tr-" + InstanceIdShort() + ".opportunity_contact_role",
          source: "out_opportunitycontactrole",
          primary_key: [
            "Id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-crm-tr-" + InstanceIdShort() + ".event",
          source: "out_event",
          primary_key: [
            "Id",
          ],
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
        },
        {
          destination: "out.c-crm-tr-" + InstanceIdShort() + ".opportunity_stage",
          source: "out_opportunitystage",
          primary_key: [
            "Id",
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
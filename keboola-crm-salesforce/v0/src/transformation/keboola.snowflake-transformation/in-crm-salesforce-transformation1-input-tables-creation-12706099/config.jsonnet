{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".account",
          destination: "account",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".contact",
          destination: "contact",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".lead",
          destination: "lead",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".event",
          destination: "event",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".opportunity",
          destination: "opportunity",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".opportunitycontactrole",
          destination: "opportunitycontactrole",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".opportunitystage",
          destination: "opportunitystage",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-kds-team-ex-salesforce-v2-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".user",
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
          destination: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".account",
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
          destination: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".contact",
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
          destination: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".lead",
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
          destination: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".user",
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
          destination: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".opportunity",
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
          destination: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".opportunity_contact_role",
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
          destination: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".event",
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
          destination: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".opportunity_stage",
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
  processors: {
    after: [
      {
        definition: {
          component: "keboola.processor-add-metadata",
        },
        parameters: {
          tables: [
            {
              table: "out_account",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "SalesforceCrm.internal.inSalesforceAccount",
                },
                {
                  key: "scaffold.id",
                  value: "SalesforceCrm",
                },
              ],
            },
            {
              table: "out_contact",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "SalesforceCrm.internal.inSalesforceContact",
                },
                {
                  key: "scaffold.id",
                  value: "SalesforceCrm",
                },
              ],
            },
            {
              table: "out_lead",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "SalesforceCrm.internal.inSalesforceLead",
                },
                {
                  key: "scaffold.id",
                  value: "SalesforceCrm",
                },
              ],
            },
            {
              table: "out_user",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "SalesforceCrm.internal.inSalesforceUser",
                },
                {
                  key: "scaffold.id",
                  value: "SalesforceCrm",
                },
              ],
            },
            {
              table: "out_opportunity",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "SalesforceCrm.internal.inSalesforceOpportunity",
                },
                {
                  key: "scaffold.id",
                  value: "SalesforceCrm",
                },
              ],
            },
            {
              table: "out_opportunitycontactrole",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "SalesforceCrm.internal.inSalesforceOpportunitycontactrole",
                },
                {
                  key: "scaffold.id",
                  value: "SalesforceCrm",
                },
              ],
            },
            {
              table: "out_event",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "SalesforceCrm.internal.inSalesforceEvent",
                },
                {
                  key: "scaffold.id",
                  value: "SalesforceCrm",
                },
              ],
            },
            {
              table: "out_opportunitystage",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "SalesforceCrm.internal.inSalesforceOpportunitystage",
                },
                {
                  key: "scaffold.id",
                  value: "SalesforceCrm",
                },
              ],
            },
          ],
        },
      },
    ],
  },
}

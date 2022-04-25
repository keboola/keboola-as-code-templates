{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".account",
          destination: "account",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".contact",
          destination: "contact",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".event",
          destination: "event",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".lead",
          destination: "lead",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".opportunity",
          destination: "opportunity",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".opportunity_contact_role",
          destination: "opportunity_contact_role",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".user",
          destination: "user",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".opportunity_stage",
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
          destination: "out.c-crm-wr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".company",
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
          destination: "out.c-crm-wr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".contact",
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
          destination: "out.c-crm-wr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".employee",
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
          destination: "out.c-crm-wr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".opportunity",
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
          destination: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".opportunity_snapshot",
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
          destination: "out.c-crm-wr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".activity",
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
          destination: "out.c-crm-wr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".opportunity_contact",
          source: "out_opportunity_contact",
          primary_key: [
            "opportunity_contact_id",
          ],
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
              table: "out_company",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "bdm.Crm.Company",
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
                  value: "bdm.Crm.Contact",
                },
                {
                  key: "scaffold.id",
                  value: "SalesforceCrm",
                },
              ],
            },
            {
              table: "out_employee",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "bdm.Crm.Employee",
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
                  value: "bdm.Crm.Opportunity",
                },
                {
                  key: "scaffold.id",
                  value: "SalesforceCrm",
                },
              ],
            },
            {
              table: "out_opportunity_snapshot",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "SalesforceCrm.internal.outCrmAuxiliaryTablesOpportunitySnapshot",
                },
                {
                  key: "scaffold.id",
                  value: "SalesforceCrm",
                },
              ],
            },
            {
              table: "out_activity",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "bdm.Crm.Activity",
                },
                {
                  key: "scaffold.id",
                  value: "SalesforceCrm",
                },
              ],
            },
            {
              table: "out_opportunity_contact",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "bdm.Crm.OpportunityContact",
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

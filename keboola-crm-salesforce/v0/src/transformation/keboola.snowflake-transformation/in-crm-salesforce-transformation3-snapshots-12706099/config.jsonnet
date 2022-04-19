{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-tr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".opportunity_snapshot",
          destination: "opportunity_snapshot",
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
          destination: "out.c-crm-wr-" + ConfigId("in-crm-salesforce-extractor-12706099") + ".opportunity_snapshot",
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
              table: "out_opportunity_snapshot",
              metadata: [
                {
                  key: "bdm.scaffold.table.tag",
                  value: "bdm.Crm.OpportunitySnapshot",
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

{
  parameters: {},
  storage: {
    output: {
      tables: [
        {
          destination: "out.c-crm-wr-" + ConfigId("in-crm-hubspot-extractor-7513249") + ".opportunity_snapshot",
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
    input: {
      tables: [
        {
          source: "out.c-crm-tr-" + ConfigId("in-crm-hubspot-extractor-7513249") + ".opportunity_snapshot",
          destination: "opportunity_snapshot",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
  },
}

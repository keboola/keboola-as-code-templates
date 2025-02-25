{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "out.c-crm-tr-" + InstanceIdShort() + ".opportunity_snapshot",
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
          destination: "out.c-crm-wr-" + InstanceIdShort() + ".opportunity_snapshot",
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
  }
}

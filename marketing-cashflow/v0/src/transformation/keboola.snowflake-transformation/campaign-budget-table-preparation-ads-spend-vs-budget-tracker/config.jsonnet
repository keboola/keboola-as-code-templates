{
  parameters: {},
  storage: {
    output: {
      tables: [
        {
          destination: "out.c-Marketing_cash_flow.campaign_budget",
          source: "campaign_budget",
          incremental: true,
          delete_where_column: "",
          delete_where_operator: "eq",
          delete_where_values: [],
          primary_key: [
            "src_id",
          ],
        },
      ],
    },
  },
}
